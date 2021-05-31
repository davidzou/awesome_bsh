#!/usr/bin/env bash

# ****************************************************************************************
#  Flutter 生成项目所需的图片文件，包含iOS，Android，华为渠道发布等。
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
## 一次性转换Android，IOS，LuaunchIcon的问题
##
## 依赖Imagemagick库，需先行安装
##
##    ```brew install imagemagick```
##
## 参数1： 原图片文件，尺寸1024*1024，png格式。
## 参数2: 输出目录地址。


SOURCE_FILE=$1
OUTPUT_DIR=$2

## 没有参数
if [[ -z "$SOURCE_FILE" ]]; then
  #statements
  echo "Invalid param"
  exit -1
fi

## 找不到文件
if [[ ! -f "$SOURCE_FILE" ]] ; then
  echo "Not Found -- $SOURCE_FILE"
  exit -1
fi

## 输出目录，没有的自建，但不能为空
if [[ -z "$OUTPUT_DIR" ]] ; then
  echo "Output Not initial"
  exit -1
fi

if [[ ! -d "$OUTPUT_DIR" ]]; then
  #statements
  echo "Not a dir, do you want to create it[y/n]"
  read -r result
  if [[ "$result" == 'y' ]]; then
    echo "create it"
  else
    exit 0
  fi
fi

## 图片如果不是1024*1024的检验
## convert mental_arthmetic_1024.png -print "Size: %w, %h\n" /dev/null

## 创建每个项目所需的文件目录
mkdir -p $OUTPUT_DIR/ios
mkdir -p $OUTPUT_DIR/android
mkdir -p $OUTPUT_DIR/huawei_market
mkdir -p $OUTPUT_DIR/tencent_market

size_ios=("20x20" "29x29" "40x40" "58x58" "60x60" "76x76" "80x80" "87x87" "120x120" "152x152" "167x167" "180x180" "1024x1024")
size_android=("48x48" "72x72" "96x96" "144x144" "192x192")
size_dir_android=("mipmap-mdpi" "mipmap-hdpi" "mipmap-xhdpi" "mipmap-xxhdpi" "mipmap-xxxhdpi")


## 转换IOS
for size in "${size_ios[@]}"; do
  convert "$SOURCE_FILE" -resize $size "$OUTPUT_DIR/ios/appicon_${size%%x*}.png"
done

## 转换Android
for (( i = 0; i < ${#size_android[@]}; i++ )); do
  mkdir -p $OUTPUT_DIR/android/${size_dir_android[$i]}
  convert $SOURCE_FILE -resize ${size_android[$i]} "$OUTPUT_DIR/android/${size_dir_android[$i]}/ic_launcher.png"
done

## 转换华为市场提交用
convert $SOURCE_FILE -resize 216x216 "$OUTPUT_DIR/huawei_market/icon.png"

## 转换腾讯应用宝市场图标
## 应用小图标  16*16
## 应用图标   512*512
## 应用截图   320*480 480*800
convert $SOURCE_FILE -resize 16x16 "$OUTPUT_DIR/tencent_market/icon_16.png"
convert $SOURCE_FILE -resize 512x512 "$OUTPUT_DIR/tencent_market/icon_512.png"
