#!/bin/zsh


# 如果当前是在会话中，退出
if [ -z $TMUX ]; then
	session="main"

	# 判断session是否存在，如果存在直接使用，否则创建会话
	if tmux has-session -t $session ; then
		# 接入会话
		tmux a -t main
	else
		tmux new -s $session
	fi
fi


