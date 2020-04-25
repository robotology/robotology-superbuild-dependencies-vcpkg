scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" 
installerRootPath=`realpath $scriptDirectory/..`

# Source vcpkg script 
source $installerRootPath/scripts/setup-vcpkg.sh

# Source gazebo script (if it exists)
gazeboScript=$installerRootPath/scripts/setup-gazebo.sh
if test -f "$gazeboScript"; then
    source $gazeboScript
fi