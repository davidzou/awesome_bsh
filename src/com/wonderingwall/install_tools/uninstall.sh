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

RESULT=$(which ${COMMAND})

if [[ -z ${RESULT} ]]; then
    echo "Not found ${COMMAND}"
else
    if [[ -L ${RESULT} ]] ; then
        rm "${RESULT}"
        echo "Remove old command -- ${RESULT}"
    fi
fi
