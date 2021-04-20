function podmanImagesRemoveUntagged
    podman rmi $(podman images -qf "dangling=true") $argv
end
