#!/bin/bash
# ****************************************************************************************
#  Flutter 创建package项目命令
#  version    : @version@
#  author     : @author@
#  date       : @date@
#
#  [功能]:
#       用于生成Flutter项目，减少org的输入。
#
#  [执行流程]:
#
#  [传参解析]:
# ****************************************************************************************

##
ORG=com.wonderingwall

## 检测参数，输入项目名称
if [ -z "$1" ] ; then
  echo "Type a package name [flutter_package_name]"
	read -r PROJECT_NAME
else
	echo "not null echo $1"
	PROJECT_NAME=$1
fi

echo "We created project with name '$PROJECT_NAME'"

flutter create -t package --project-name "${PROJECT_NAME}" --org $ORG -a java -i swift "${PROJECT_NAME}"
