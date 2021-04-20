function ssh-auto-retry
    set -l RC 1

    while test $RC -ne 0
        ssh $argv "uname -a > /dev/null 2>&1" >/dev/null 2>&1
        set RC $status

        if [ $RC -ne 0 ]
            sleep 3
        end

        ssh $argv
    end
end

function ssh-cmd-to-hosts
    # trim whitespaces
    set -l HOSTS (echo $argv[1] | sed -e "s/ //g")
    set -l CMD $argv[2]

    if not test -n $HOSTS
        echo 'first argument coma separated list of hosts is required.' 1>&2
        return 1
    end

    if not test -n $CMD
        echo 'second argument command to run is required.' 1>&2
        return 1
    end

    for host in (string split ',' $HOSTS)
        if [ $host = localhost ]
            eval "$CMD &"
        else
            ssh $host (string join "&& " "hostname && ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p'" $CMD) &
        end
    end

    wait
end
