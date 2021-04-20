function _beckend_common
    # -S gives access to caller scope, so we can access the variable as ARG_1
    function defaultGet -S
        set -l ARG_1 $argv[1]
        set -l ARG_2 $argv[2]

        set -q "$ARG_1" && echo "$$ARG_1" || echo "$ARG_2"
    end

    function fileExists
        if test -f "$argv[1]"
            echo true
        else
            echo false
        end
    end
end
