#!/bin/bash

# 前置步骤：
# sql更新脚本已在数据库中执行
# docker中mysql相关的演示站数据重置sql脚本已更新
# ./docker/qModel/server/upload-init文件夹已更新
# 前端dist文件已打包最新版，存放至./docker/qModel/nginx/下

# ==========================================
# 1. 定义版本号
# ==========================================
OLD_VERSION="1.4.1"
NEW_VERSION="1.4.2"

echo "🚀 准备将项目版本号从 $OLD_VERSION 升级至: $NEW_VERSION"

# ==========================================
# 2. 定义需要排除的目录
# ==========================================
# 在这里添加需要排除的目录名，后续只需修改这个数组即可
EXCLUDE_DIRS=(".git" "docker")

# 使用数组来构建 find 命令的参数
# 初始化基础参数
FIND_ARGS=(. -name "pom.xml")

# 循环追加排除参数
for dir in "${EXCLUDE_DIRS[@]}"; do
    FIND_ARGS+=(-not -path "*/$dir/*")
done

# ==========================================
# 3. 升级所有 pom.xml 文件中的版本号
# ==========================================
echo "📦 正在扫描并升级所有 pom.xml 文件..."

# 使用 eval 执行拼接好的 find 命令
eval "find . -name 'pom.xml' $EXCLUDE_PARAMS" | while read -r pom_file; do
    echo "  -> 正在处理: $pom_file"

    # 精准替换版本号
    sed -i.bak -E "s|<version>$OLD_VERSION</version>|<version>$NEW_VERSION</version>|g" "$pom_file"

    # 删除 sed 自动生成的备份文件
    rm -f "${pom_file}.bak"
done

# ==========================================
# 4. 升级 ./docker/.env 文件中的版本号
# ==========================================
ENV_FILE="./docker/.env"

if [ -f "$ENV_FILE" ]; then
    echo "🐳 正在升级 Docker 环境变量文件: $ENV_FILE"

    # 精准替换版本号
    sed -i.bak -E "s/^QMODEL_VERSION=$OLD_VERSION/QMODEL_VERSION=$NEW_VERSION/" "$ENV_FILE"

    rm -f "${ENV_FILE}.bak"
else
    echo "⚠️  警告: 未找到 $ENV_FILE 文件，跳过 Docker 环境配置升级。"
fi

echo "✅ 版本号升级完成！"

# 阿里云镜像仓库配置
REGISTRY_URL="crpi-kf13onfj0v8f6jax.cn-shanghai.personal.cr.aliyuncs.com"
REPO_PATH="qiantongkeji/qmodel-server-ce"
FULL_IMAGE_NAME="${REGISTRY_URL}/${REPO_PATH}"

# ==========================================
# 5. 登录阿里云镜像仓库
# ==========================================
echo "🔑 正在检查阿里云镜像仓库登录状态..."

# 通过 docker-credential-helpers 或直接尝试拉取一个不存在的镜像来判断登录状态
# 这里使用 docker info 检查是否已配置凭证
if docker login --username=zhuzhuxia12138 --password-stdin $REGISTRY_URL < /dev/null 2>/dev/null; then
    echo "✅ 已登录阿里云镜像仓库，跳过登录步骤。"
else
    echo "⚠️  未登录或登录已过期，正在登录..."
    docker login --username=zhuzhuxia12138 $REGISTRY_URL

    if [ $? -ne 0 ]; then
        echo "❌ 登录失败，请检查用户名或密码。"
        exit 1
    fi

    echo "✅ 登录成功。"
fi

# ==========================================
# 6. 管理 Builder (删除旧的重建)
# ==========================================
echo "🏗️ 正在配置 Docker Buildx Builder..."

# 尝试删除旧的 builder，如果不存在则忽略错误
docker buildx rm qmodel-builder 2>/dev/null || true

# 创建新的 builder
docker buildx create \
  --name qmodel-builder \
  --driver docker-container \
  --use

echo "✅ Builder 配置完成。"

# ==========================================
# 7. 检查并清理本地旧镜像 (可选)
# ==========================================
LOCAL_IMAGE_CHECK=$(docker images -q "${FULL_IMAGE_NAME}:${NEW_VERSION}" 2>/dev/null)
if [ -n "$LOCAL_IMAGE_CHECK" ]; then
    echo "🧹 检测到本地已存在镜像 ${FULL_IMAGE_NAME}:${NEW_VERSION}，正在删除..."
    docker rmi "${FULL_IMAGE_NAME}:${NEW_VERSION}"
fi

# ==========================================
# 8. 打包、构建镜像并执行推送
# ==========================================
echo "🚀 开始 Maven 构建、打包并推送 Docker 镜像..."
mvn -B clean deploy -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -Dmaven.deploy.skip=true -Ddocker.build.skip=false -Ddocker.push.skip=false

# ==========================================
# 9. 打包前端
# ==========================================
echo "🎨 开始打包前端..."

# 9.1 本地打包前端
echo "📦 正在本地打包前端 dist 文件..."
cd qmodel-ui
sh build-prod.sh

if [ $? -ne 0 ]; then
    echo "❌ 前端打包失败，请检查构建日志。"
    exit 1
fi
echo "✅ 前端打包完成。"

# 9.2 拷贝打包好的dist文件至 docker 目录下
echo "📂 正在拷贝打包好的 dist 文件至 docker 目录下..."
cd ../
rm -rf ./docker/qModel/nginx/dist
cp -r .qmodel-ui/dist ./docker/qModel/nginx/

# ==========================================
# 10. 部署到远程服务器
# ==========================================
REMOTE_HOST="192.168.0.100"
REMOTE_USER="qtt"
REMOTE_DIR="~/opt/qModel"

echo "🚀 正在部署到远程服务器 $REMOTE_HOST..."

# 10.1 上传 docker 文件到远程服务器
# 先清空远程服务器上的旧 docker 文件，再上传新的
ssh ${REMOTE_USER}@${REMOTE_HOST} "sudo rm -rf ${REMOTE_DIR}/docker"
echo "📤 正在上传 docker 文件至 $REMOTE_HOST:$REMOTE_DIR/ ..."
scp -r ./docker ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/

echo "✅ docker 文件上传成功。"

# 10.2 远程执行 docker-compose 启动服务
echo "🐳 正在远程启动 Docker 服务..."
ssh ${REMOTE_USER}@${REMOTE_HOST} "cd ${REMOTE_DIR}/docker && docker-compose -p qmodel --profile all up -d"

if [ $? -eq 0 ]; then
    echo "🎉 远程服务启动成功！"
else
    echo "❌ 远程服务启动失败，请登录服务器检查日志。"
    exit 1
fi
