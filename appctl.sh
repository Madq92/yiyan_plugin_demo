#!/bin/bash

PROG_NAME=$0
ACTION=$1


usage() {
    echo "Usage: $PROG_NAME {build|start|stop|online|offline|pubstart|restart|deploy}"
    exit 2 # bad usage
}


if [ $# -lt 1 ]; then
    usage
    exit 2 # bad usage
fi

APP_HOME=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)
echo "INFO: APP_HOME= ${APP_HOME}"

update(){
    git pull
}

build(){
    docker build -t yiyan_plugin_demo:v1.2 .
}

start(){
    docker run -d -p 7000:8080 --name yiyan yiyan_plugin_demo:v1.2
}

stop(){
    docker stop yiyan
    docker rm yiyan
}

main() {
    now=`date "+%Y-%m-%d %H:%M:%S"`
    echo "$now--------------------------"

    case "$ACTION" in
        restart)
            stop
            start
        ;;
        deploy)
            stop
            update
            build
            start
        ;;
        start)
            start
        ;;
        stop)
            stop
        ;;
        *)
            usage
        ;;
    esac
}

main