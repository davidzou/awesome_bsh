#!/bin/bash
# ****************************************************************************************
#  Flutter 创建app项目命令
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
    echo "Type a app name [flutter_app_name], it used for app_name, flutter app name in 'pubspec.yaml'."
	read -r PROJECT_NAME
else
	echo "You typed project name : $1"
	PROJECT_NAME=$1
fi

## 是否输入目录名称，目录名称和项目名称可以不一致
echo "Type a project dir name , if empty that ctreate dir of name is '[$PROJECT_NAME]'."
read -r DIR
if [ -z "$DIR" ] ; then
    DIR_NAME=$PROJECT_NAME
else
    DIR_NAME=$DIR
fi


echo "We are creating a app project that name is '$PROJECT_NAME' in dir '$DIR_NAME'."

flutter create --project-name "${PROJECT_NAME}" --platforms android,ios --org $ORG "${DIR_NAME}"
