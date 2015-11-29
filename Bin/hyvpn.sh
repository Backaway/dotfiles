#!/bin/bash
TYPE=yidong
OPENVPN_DIR=/etc/openvpn
LOG_DIR=$HOME/Logs
CRT_FILE=$OPENVPN_DIR/cmccrd_ca.crt
CHINAMOBILE_FILE=$OPENVPN_DIR/xiaoshan_yidong.ovpn
TELECOM_FILE=$OPENVPN_DIR/xiaoshan_dianxin.ovpn
CONFIG_FILE=$CHINAMOBILE_FILE
SERVER_IP=192.168.11.4
SERVER_PORT=80

case $TYPE in
    yidong )
        CONFIG_FILE=$CHINAMOBILE_FILE
        ;;
    dianxin )
        CONFIG_FILE=$TELECOM_FILE
        ;;
    ? )
        echo "Error Type!"
        exit 1
esac

start(){
    echo "Starting openvpn..."
    if [ ! -d $LOG_DIR ]
    then
        mkdir -p $LOG_DIR
    fi
    cd $OPENVPN_DIR
    sudo nohup openvpn --config $CONFIG_FILE --ca $CRT_FILE> $LOG_DIR/openvpn.log 2>&1 &
}

stop(){
    echo "Shutting down xiaoshan chinamobile openvpn..."
    ps -ef | grep 'openvpn' | grep -v grep | awk '{print $2}' | sudo xargs kill -9
    echo "Shutting down xiaoshan telecom openvpn..."
    ps -ef | grep 'openvpn' | grep -v grep | awk '{print $2}' | sudo xargs kill -9
}

status(){
    openvpn_pid=`ps -ef | grep 'openvpn' | grep -v "grep" | awk '{print $2}'`
    openvpn_start=`ps -ef | grep 'openvpn' | grep -v "grep" | awk '{print $5}'`
    openvpn_lasts=`ps -ef | grep 'openvpn' | grep -v "grep" | awk '{print $7}'`
    if [ ! -z "$openvpn_pid" ]; then
        echo "openvpn is running now"
        echo "  PID: $openvpn_pid"
        echo "  Start time: $openvpn_start"
        echo "  Lasts: $openvpn_lasts"
    else
        echo "openvpn is stopped"
    fi
}

test(){
    echo "Test connection to $SERVER_IP:$SERVER_PORT..."
    nc $SERVER_IP $SERVER_PORT -v -w 2
    h=`echo $?`
    if [ $h -ne 0 ]; then
        echo "Unable to connect to $SERVER_IP:$SERVER_PORT"
    fi
}

case $1 in
    start )
        start
        sleep 5
        test
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
