#!/bin/sh	

PROC_NAME=clash
ProcNumber=`ps -ef | grep -w $PROC_NAME | grep -v grep | wc -l`

if [ $ProcNumber -le 0 ]; then
	clash > ~/.clash_log 2>&1 &
fi





