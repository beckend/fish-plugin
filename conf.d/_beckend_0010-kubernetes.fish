function kc_re_apply
    set -l file_path ""

    # Parse arguments
    for arg in $argv
        switch $arg
            case '*'
                if test -z "$file_path"
                    set file_path $arg
                end
        end
    end

    kubectl delete -f $file_path
    kubectl apply -f $file_path
end
