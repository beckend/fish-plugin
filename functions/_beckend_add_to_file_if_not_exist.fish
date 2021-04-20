function _beckend_add_to_file_if_not_exist
    set -l FILE_TARGET (echo $argv[1] | sed -e "s/ //g")
    set -l STRING_TO_ADD (echo $argv[2] | sed -e "s/ //g")

    if not test -n $FILE_TARGET
        echo 'first argument is the target file to add.' 1>&2
        return 1
    end

    if not test -n $STRING_TO_ADD
        echo 'second argument is the string to add.' 1>&2
        return 1
    end

    if not grep -q $STRING_TO_ADD $FILE_TARGET
        sed -i -e (string join $STRING_TO_ADD '$a' "") $FILE_TARGET
    end
end
