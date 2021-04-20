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
