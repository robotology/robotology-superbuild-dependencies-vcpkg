@echo off

pushd %~dp0..
set installerRootPath=%cd%
popd

rem Call vcpkg script
call %installerRootPath%\scripts\setup-vcpkg.bat 

rem Call gazebo script (if it exists)
set gazeboScript=%installerRootPath%\scripts\setup-gazebo.bat 
if exist %gazeboScript% call %gazeboScript% 
