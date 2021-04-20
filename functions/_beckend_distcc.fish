function _beckend_distcc -d distcc
    if ! type -q pump
        return
    end

    if ! set -q DISTCC_HOSTS
        set -gx DISTCC_HOSTS "localhost,cpp,lzo"
        pump --startup >/dev/null
    end
end
