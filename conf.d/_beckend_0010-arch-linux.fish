function addGPGKey
    # gpg --keyserver hkps://keys.openpgp.org --recv-keys $argv
    gpg --keyserver hkp://pgp.rediris.es --recv-keys $argv
end
