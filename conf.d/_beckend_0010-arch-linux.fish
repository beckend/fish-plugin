function addGPGKey
    # gpg --keyserver hkps://keys.openpgp.org --recv-keys $argv
    gpg --keyserver hkp://pgp.rediris.es --recv-keys $argv
end

if type -q pkgfile
    function fish_command_not_found
        echo "Command not found, potential packages: "
        /usr/bin/pkgfile $argv[1]
    end
end

function parus
    paru --needed --noconfirm --batchinstall -S $argv
end

function parurs
    paru --noconfirm -Rs $argv
end

function yays
    /usr/bin/yay --needed --noconfirm -S $argv
end

function yayrs
    /usr/bin/yay --noconfirm -Rs $argv
end
