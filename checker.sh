#!/usr/bin/env bash
#
# .git/hooks/pre-commit 插入下面脚本，在commit执行前执行checkstyle任务
#
SCRIPT_DIR=$(dirname "$0")
echo ${SCRIPT_DIR}
SCRIPT_ABS_PATH=`cd "$SCRIPT_DIR"; pwd`
${SCRIPT_ABS_PATH}/../../gradlew checkstyle
if [ $? -eq 0   ]; then
    echo "checkstyle OK"
else
	echo "checkstyle fail"
    exit 1
fi