if type -q vcpkg
    if not string length --quiet $VCPKG_ROOT
        set -x VCPKG_ROOT $HOME/.local/share/vcpkg
    end


    if not string length --quiet $VCPKG_BINARY_SOURCES
        set -x VCPKG_BINARY_SOURCES "default,readwrite;nuget,Test-VTDFeed,readwrite"
    end


    if not string length --quiet $VCPKG_USE_NUGET_CACHE
        set -x VCPKG_USE_NUGET_CACHE 1
    end
end
