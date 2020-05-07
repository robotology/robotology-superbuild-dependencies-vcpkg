@echo off

pushd %~dp0..
set installerRootPath=%cd%
popd


set "PATH=%PATH%;%installerRootPath%\gazebo\install\bin"
call %installerRootPath%\gazebo\install\share\gazebo\setup.bat
