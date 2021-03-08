#!/usr/bin/env bash
# ****************************************************************************************
#  [脚本标题描述]
#  version    : @version@
#  author     : @author@
#  date       : @date@
#
#  [功能]:
#
#  [执行流程]:
#
#  [传参解析]:
#
#  [环境配置]:
#
# ****************************************************************************************

COMMAND=@command@

bash uninstall

if [[ -z $1 ]] ; then
    ln -s `pwd`/${COMMAND} /usr/local/bin/${COMMAND}
else
    ln -s `pwd`/${COMMAND} ${1%*/}/${COMMAND}
fi
