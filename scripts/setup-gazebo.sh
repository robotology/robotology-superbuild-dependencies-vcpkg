scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" 
installerRootPath=`realpath $scriptDirectory/..`
gazeboInstallDir=$installerRootPath/gazebo/install
gazeboMajorVersion="11"

vcpkgTriplet="x64-windows"
vcpkgInstallDir=${installerRootPath}/vcpkg/installed/${vcpkgTriplet}

export PATH=$PATH:$gazeboInstallDir/bin

export GAZEBO_MASTER_URI=http://localhost:11345
export GAZEBO_MODEL_DATABASE_URI=http://models.gazebosim.org
# https://unix.stackexchange.com/questions/162891/append-to-path-like-variable-without-creating-leading-colon-if-unset
export GAZEBO_RESOURCE_PATH=${GAZEBO_RESOURCE_PATH:+${GAZEBO_RESOURCE_PATH}:}${gazeboInstallDir}/share/gazebo-${gazeboMajorVersion}
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH:+${GAZEBO_PLUGIN_PATH}:}${gazeboInstallDir}/bin/gazebo-${gazeboMajorVersion}/plugins
export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH:+${GAZEBO_MODEL_PATH}:}${gazeboInstallDir}/share/gazebo-${gazeboMajorVersion}/models
export PATH=$PATH:${gazeboInstallDir}/bin/gazebo-${gazeboMajorVersion}/plugins
export OGRE_RESOURCE_PATH=${vcpkgInstallDir}/bin




