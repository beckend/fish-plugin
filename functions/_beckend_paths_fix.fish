function _beckend_paths_fix
    set -l PATH_BIN_DEFAULTS /usr/local/bin /usr/bin /bin
    set -U fish_user_paths

    for path in $PATH_BIN_DEFAULTS
        set -l path_versions "$path" (string join '' "$path" "/")

        for p in $path_versions
            if set -l index (contains -i -- "$p" $PATH)
                set -ge PATH[$index]
            end
        end
    end

    for path in $PATH_BIN_DEFAULTS
        fish_add_path -gmPa "$path"
    end
end
