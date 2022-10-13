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
  echo "Type a package name [flutter_package_name], it used for app_name, flutter package name in 'pubspec.yaml'."
	read -r PROJECT_NAME
else
	echo "not null echo $1"
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


echo "We are creating a package project that name is '$PROJECT_NAME' in dir '$DIR_NAME'."

flutter create -t package --project-name "${PROJECT_NAME}" --org $ORG -a java -i swift "${DIR_NAME}"


## PROJECT_NAME 的定义直接被认定为项目的名称，app_name显示也是它，还有就是当package被引用,此Package的名字也是这个。


## 创建项目
## 1. 直接创建项目，给定项目名称即可，目录名称相同
## 2. 指定模版创建项目，减少项目初始化编写时间。
## 3. 指定package名，自动改写。第一次创建可，后续直接改
## 4. 转化应用图片，启动图片等。
