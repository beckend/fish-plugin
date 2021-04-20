function dockerGetFirstByName
    echo (docker ps --format '{{.Names}}' | grep -i "$argv[1]" | awk '{print$1}')
end

function dockerExecByName
    set -l NAME_SEARCH $argv[1]
    set -l ARGUMENTS_REST $argv[2..-1]

    docker exec -it (dockerGetFirstByName "$NAME_SEARCH") $ARGUMENTS_REST
end

function dockerLogsFollowByName
    set -l NAME_SEARCH $argv[1]
    set -l ARGUMENTS_REST $argv[2..-1]

    docker logs -f (dockerGetFirstByName "$NAME_SEARCH")
end

function dockerClearLogs
    sudo sh -c "truncate -s 0 /var/lib/docker/containers/*/*-json.log"
end

function dockerResetAllButNetwork
    set -l CONTAINERS_ACTIVE (docker ps -qa)

    # or docker container prune -f
    if test -n "$CONTAINERS_ACTIVE"
        docker stop "$CONTAINERS_ACTIVE"
        docker rm (docker ps -qa) -f
    end


    set -l IMAGES_LIST (docker images -qa)

    if test -n "$IMAGES_LIST"
        docker image rm (docker images -qa) -f
    end
end

function dockerResetAll
    set -l CONTAINERS_ACTIVE (docker ps -qa)

    # or docker container prune -f
    if test -n "$CONTAINERS_ACTIVE"
        docker stop "$CONTAINERS_ACTIVE"
        docker rm (docker ps -qa) -f
    end


    docker system prune -a --volumes -f
end
