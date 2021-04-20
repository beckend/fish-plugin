function podmanGetFirstByName
    podman container ps --format '{{.ID}} {{.Names}}' | grep -i "$argv[1]" | awk 'NR==1{print $1}'
end

function podmanExecByName
    set -l NAME_SEARCH $argv[1]
    set -l ARGUMENTS_REST $argv[2..-1]

    podman exec -it (podmanGetFirstByName "$NAME_SEARCH") $ARGUMENTS_REST
end

function podmanLogsFollowByName
    set -l NAME_SEARCH $argv[1]
    set -l ARGUMENTS_REST $argv[2..-1]

    podman logs -f (podmanGetFirstByName "$NAME_SEARCH")
end
