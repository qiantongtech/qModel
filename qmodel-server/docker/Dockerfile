FROM crpi-kf13onfj0v8f6jax.cn-shanghai.personal.cr.aliyuncs.com/qiantongkeji/eclipse-temurin:8-jre

ENV TZ=Asia/Shanghai \
    APP_HOME=/usr/app/jar \
    DEBIAN_FRONTEND=noninteractive

RUN \
    # 替换Debian国内源
    sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    # 更新并安装python
    apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    # 配置全局pip阿里源，增加目录兼容
    mkdir -p /etc/pip && \
    echo "[global]" > /etc/pip/pip.conf && \
    echo "index-url = https://mirrors.aliyun.com/pypi/simple" >> /etc/pip/pip.conf && \
    echo "trusted-host = mirrors.aliyun.com" >> /etc/pip/pip.conf && \
    # python软链接
    ln -s /usr/bin/python3 /usr/bin/python && \
    # 时区配置
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    # 清理系统安装缓存
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p $APP_HOME

WORKDIR $APP_HOME
COPY ./target/*.jar ./qmodel.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Xms512m", "-Xmx2g", "-Dspring.profiles.active=prod", "-jar", "qmodel.jar"]
CMD ["--server.port=8080"]
