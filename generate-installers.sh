#! /bin/bash
# This bash script has been tested under Windows with Git Bash 

# Make sure that QtIFW is on the path before running this script 
if ! [ -x "$(command -v repogen.exe)" ]; then
  echo 'Error: QtIFW is not in the PATH. Plese install it and add it to the path.' >&2
  exit 1
fi

# Create a build directory and an artefacts directory 
rm -rf build 
mkdir build

# Copy the appropriate version of vcpkg-cpack
cd build
git clone https://github.com/robotology-playground/vcpkg-cpack -b devel
cd ..

# Copy the ipopt custom port 
cd build 
git clone https://github.com/robotology-dependencies/robotology-vcpkg-binary-ports
export VCPKG_ADDITIONAL_OPTIONS=--overlay-ports=`pwd`/robotology-vcpkg-binary-ports
cd .. 

# Create x64-windows installers 
cd build
rm -rf x64-windows
mkdir x64-windows
cd x64-windows 
cmake -A x64 -C ../../config/x64-windows.cmake -DVCPKG_ADDITIONAL_OPTIONS=${VCPKG_ADDITIONAL_OPTIONS} ../vcpkg-cpack
cmake --build . --config Release --target PACKAGE 
cd ../..

# Copy installer in artifacts
echo "Copying installers in artifacts directory"
rm -rf artifacts
mkdir artifacts
VERSION="0.1.0"
cp ./build/x64-windows/robotology-additional-dependencies-${VERSION}-x86_amd64.exe ./artifacts/robotology-additional-dependencies-${VERSION}-v141-x86_amd64.exe
cp ./build/x64-windows/robotology-additional-dependencies-${VERSION}-x86_amd64.zip ./artifacts/robotology-additional-dependencies-${VERSION}-v141-x86_amd64.zip
 
echo "idjl-dependencies-installer correctly generated and copies in artefacts"
exit 0

