# robotology-superbuild-dependencies

Windows binary installer for the dependencies of robotology-superbuild .

The following libraries (and their dependencies) are built using `vcpkg`: 
* `ace`
* `freeglut`
* `gsl`
* `eigen3`
* `ode`
* `libxml2`
* `eigen3` 
* `opencv3` 
* `matio`
* `sdl1`
* `sdl2`
* `qt5`

furthermore, the `ipopt-binary` from [`robotology-vcpkg-binary-ports`](https://github.com/robotology-dependencies/robotology-vcpkg-binary-ports) is also installed.

The installers are generated using the https://github.com/robotology-playground/vcpkg-cpack project .

See [releases](https://github.com/robotology-playground/robotology-superbuild-dependencies/releases) to download the installer. 


## Generate the installers 

To generate the installers, make sure that you have installed: 
* [Git for Windows (including the Git Bash)](https://gitforwindows.org/) 
* [Qt Installer Framework](http://download.qt.io/official_releases/qt-installer-framework/3.0.6/) 
* [CMake](https://cmake.org/download/) 

Furthermore, make sure that the Qt Installer Framework executable directory (tipically `C:\Qt\QtIFW-3.0.6` or something similar) is in the `Path`.
Then, launch the `Git Bash`, clone this repository and launch the `generate-installers.sh` script:
~~~
git clone https://github.com/robotology-playground/robotology-superbuild-dependencies
cd robotology-superbuild-dependencies
./generate-installers.sh
~~~
this will start the generation process for the installers. If everything went fine, after some time (depending on the speed of your PC), you should see the message 
"robotology-superbuild-dependencies correctly generated and copies in artifacts" and you should find the generated artifacts in the `robotology-superbuild-dependencies/artifacts` directory. 

To add more vcpkg ports to the installer, you can modify the `VCPKG_CPACK_TARGET_PORTS` variable in the [`config/common.cmake`](config/common.cmake) file. To understand more of the generation process, inspect the `generate-installers.sh` script and  check [`vcpkg-cpack`'s documentation](https://github.com/robotology-playground/vcpkg-cpack). 
