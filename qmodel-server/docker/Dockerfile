FROM crpi-kf13onfj0v8f6jax.cn-shanghai.personal.cr.aliyuncs.com/qiantongkeji/eclipse-temurin:8-jre

# 设置时区和应用目录
ENV TZ=Asia/Shanghai \
    APP_HOME=/usr/app/jar

# 安装 Python3 和 pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    # 创建软链接，方便调用（让 python 指向 python3）
    ln -s /usr/bin/python3 /usr/bin/python && \
    # 清理缓存，减小镜像体积
    rm -rf /var/lib/apt/lists/*

# 设置时区并创建工作目录
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    mkdir -p $APP_HOME

WORKDIR $APP_HOME

# 拷贝产物
COPY ./target/*.jar ./qmodel.jar

EXPOSE 8080

ENTRYPOINT ["java", "-Xms512m", "-Xmx2g", "-Dspring.profiles.active=prod", "-jar", "qmodel.jar"]
CMD ["--server.port=8080"]
