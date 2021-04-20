_beckend_common

if test -d $__fish_config_dir/custom.init.pre
    for f in $__fish_config_dir/custom.init.pre/*.fish
        if test -x $f
            source "$f"
        end
    end
end
