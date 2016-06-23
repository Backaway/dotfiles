#!/bin/bash
WIKI_HOME=$HOME/Wiki/im-wiki
LOG_DIR=$HOME/Logs

start(){
	echo "Starting gollum"
	cd $WIKI_HOME
	if [ ! -d $LOG_DIR ]
	then
		mkdir -p $LOG_DIR
	fi
	nohup  gollum --h1-title --port 8080 --config config.rb --no-edit > $LOG_DIR/gollum.log 2>&1 &
	cd ../Self
	nohup gollum --h1-title --port 8000 --config config.rb --no-edit > $LOG_DIR/gollum.log 2>&1 &
}

stop(){
	echo "Shutting down gollum ..."
	ps -ef | grep 'gollum' | grep -v grep | awk '{print $2}' | xargs kill -9
}

status(){
	gollum_pid=`ps -ef | grep 'gollum' | grep -v "grep" | awk '{print $2}'`
	gollum_start=`ps -ef | grep 'gollum' | grep -v "grep" | awk '{print $5}'`
	gollum_lasts=`ps -ef | grep 'gollum' | grep -v "grep" | awk '{print $7}'`
	if [ ! -z "$gollum_pid" ]; then
		echo "gollum is running now"
		echo "  PID: $gollum_pid"
		echo "  Start time: $gollum_start"
		echo "  Lasts: $gollum_lasts"
	else
		echo "gollum is stopped"
	fi
}

case $1 in
	start )
		start
		sleep 2
		status
		;;
	stop )
		stop
		sleep 2
		status
		;;
	restart )
		stop
		sleep 2
		start
		sleep 2
		status
		;;
	status )
		status
		;;
	* )
		echo "Usage: $0 { start | stop | restart | status }"
		exit 1
esac
exit 0
