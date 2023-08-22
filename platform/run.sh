#!/bin/bash

service=$1  # Service as the first argument
cmd=$2      # Command as the second argument

JENKINS="jenkins"
RESTART_SLEEP_SEC=2

usage() {
    echo "Usage:"
    echo "  run.sh <service> <command> [options]"
    echo "Available services:"
    echo "  $JENKINS"
    echo "Available commands:"
    echo "  up           run container"
    echo "  down         stop and remove container"
    echo "  restart      restart container"
    echo "Available options:"
    echo "  --build      rebuild when up"
    echo "  --volumes    remove volumns when down"
}

get_docker_compose_file() {
    service=$1
    docker_compose_file="$service/$service-docker-compose.yml"
    echo "$docker_compose_file"
}

up() {
    service=$1
    shift
    docker_compose_file=$(get_docker_compose_file $service)

    # Run docker compose
    docker compose -f "$docker_compose_file" up -d "$@"
}

down() {
    service=$1
    shift
    docker_compose_file=$(get_docker_compose_file $service)

    # Stop docker compose
    docker compose -f "$docker_compose_file" down "$@"
}

# JENKINS
up_jenkins() {
    up "$JENKINS" "$@"
}

down_jenkins() {
    down "$JENKINS" "$@"
}

if [[ "$1" == "-h" ]]; then
    usage
    exit 0
fi

if [[ -z "$cmd" ]]; then
    echo "Missing command"
    exit 1
fi

if [[ -z "$service" ]]; then
    echo "Missing service"
    exit 1
fi

shift 2

case $cmd in
    up)
        case $service in
            "$JENKINS")
                up_jenkins "$@"
                ;;
            *)
                echo "Unknown service: $service"
                usage
                exit 1
                ;;
        esac
        ;;
    down)
        case $service in
            "$JENKINS")
                down_jenkins "$@"
                ;;
            *)
                echo "Unknown service: $service"
                usage
                exit 1
                ;;
        esac
        ;;
    restart)
        case $service in
            "$JENKINS")
                down_jenkins "$@"
                sleep $RESTART_SLEEP_SEC
                up_jenkins "$@"
                ;;
            *)
                echo "Unknown service: $service"
                usage
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Unknown command: $cmd"
        usage
        exit 1
        ;;
esac
