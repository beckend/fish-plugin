if not string length --quiet $CMAKE_C_COMPILER && type -q gcc
    set -x CMAKE_C_COMPILER $(which gcc)
end

if not string length --quiet $CMAKE_CXX_COMPILER && type -q g++
    set -x CMAKE_CXX_COMPILER $(which g++)
end
