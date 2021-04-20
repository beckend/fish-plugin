if not type -q rtx
    return 0
end

if test (id -u) -eq 0
    return 0
end

rtx activate fish | source
