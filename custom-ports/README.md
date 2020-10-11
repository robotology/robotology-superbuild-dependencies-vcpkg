# Custom Ports

This directory contains some custom ports that are tipically used to temporary avoid problems in upstream vcpkg.

## portaudio

Backport of https://github.com/microsoft/vcpkg/pull/13306 .
Copied from https://github.com/stekyne/vcpkg/commit/07dcd902b4e109067f3e646f91873b1844685b93 . 

## ogre

Forward port of the original ogre port before https://github.com/microsoft/vcpkg/pull/12210 . 
Copied from https://github.com/microsoft/vcpkg/tree/3513e92bf9d388ac547d0a87c50a135b4eaa634c/ports/ogre .
Workaround for https://github.com/robotology/robotology-superbuild-dependencies-vcpkg/issues/29 .