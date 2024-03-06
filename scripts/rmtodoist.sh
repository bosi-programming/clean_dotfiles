#!/bin/bash

todoist-cli --color list | awk '{printf("\033[32m%010d \033[37m%s\n", NR, $0)}'

echo -e "\n\033[33mInput the line number of the task that you want to close"

read lineNumber
awkSettings="NR==$lineNumber"
awkSettings+='{print$1}'

taskNumber=`(todoist-cli list | awk $awkSettings)`

todoist-cli close $taskNumber

