function _beckend_bash_compatible -d 'paths and profile env inherit from bash.'
    set -l BLACKLISTED_KEYS _ SHELL SHELL_SESSION VR_SHELL LS_COLORS SHLVL
    set -gx VR_SHELL /bin/fish

    for path in (string split ':' (bash -lc "printenv | grep '^PATH=' | cut -c 6-"))
        _beckend_set_path "$path"
    end

    for envString in (string split0 -n -m1 ' ' (bash -lc "printenv"))
        # echo $envString
        set -l KEY_IS_BLACKLISTED false

        for keyBlacklisted in $BLACKLISTED_KEYS
            if string match -q -- (string join "=*" "$keyBlacklisted"  "") "$envString"
                set KEY_IS_BLACKLISTED true
                break
            end
        end

        if not $KEY_IS_BLACKLISTED
            set -l envSplit (string split -n -m1 '=' "$envString")
            set -l envValue "$envSplit[2]"

            if test -z "$envValue"
                continue
            end

            set -l envName (string trim "$envSplit[1]")
            set -q "$envName"

            # set missing envs
            if test $status -eq 1
                set -gx "$envName" "$envValue"
            end
        end
    end
end
