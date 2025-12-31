#!/bin/sh
#filename: publish-server.sh
# 部署Whale系统项目

targetPath="/home/qtt/src/qModel/qmodel-server/target"
# 运行目录
runPath="/home/qtt/opt/qmodel-server"

# publish
echo "Publishing qModel admin ... The installation directory is $runPath"
cd $targetPath
cp qmodel-server.jar $runPath
echo "Publish qModel success! Now you can go to the installation directory($runPath) and restart the server."

cd $runPath
sh restart.sh

tail -f logs/info.log
