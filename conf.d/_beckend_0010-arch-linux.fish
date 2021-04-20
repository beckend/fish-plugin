function addGPGKey
    gpg --keyserver keyserver.ubuntu.com --recv-keys $argv
end
