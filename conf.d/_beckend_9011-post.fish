if test -d $__fish_config_dir/custom.init.post
    for f in $__fish_config_dir/custom.init.post/*.fish
        if test -x $f
            source "$f"
        end
    end
end
