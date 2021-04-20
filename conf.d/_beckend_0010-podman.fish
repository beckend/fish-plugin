function podmanImagesRemoveUntagged
    podman rmi $(podman images -qf "dangling=true") $argv
end

function podmanLogsFollowByName
    podman logs -f (podman ps -aqf "name=$argv[1]")
end
