scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" 
installerRootPath=`realpath $scriptDirectory/..`

vcpkgTriplet="x64-windows"
vcpkgInstallDir=${installerRootPath}/vcpkg/installed/${vcpkgTriplet}

# Update PATH 
export PATH=$PATH:${vcpkgInstallDir}/bin
export PATH=$PATH:${vcpkgInstallDir}/debug/bin

# See https://unix.stackexchange.com/questions/162891/append-to-path-like-variable-without-creating-leading-colon-if-unset

# Update CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH:+${CMAKE_PREFIX_PATH}:}${vcpkgInstallDir}
export CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH:+${CMAKE_PREFIX_PATH}:}${vcpkgInstallDir}/debug

# Update CMAKE_PROGRAM_TOOLS (for protobuf)
export CMAKE_PROGRAM_PATH=${CMAKE_PROGRAM_PATH:+${CMAKE_PROGRAM_PATH}:}${vcpkgInstallDir}/tools/protobuf