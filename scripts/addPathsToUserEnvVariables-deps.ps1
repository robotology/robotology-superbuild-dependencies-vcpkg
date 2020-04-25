$installerRootPath = (Split-Path -parent (Split-Path -Path $PSCommandPath));

# Call the script to update the env variables of vcpkg 
$vcpkgTriplet = 'x64-windows';
$vcpkgScript = $installerRootPath + '\scripts\addPathsToUserEnvVariables-vcpkg.ps1'
Invoke-Expression $vcpkgScript

# Call the script to update the env variables of gazebo 
$gazeboScript = $installerRootPath + '\scripts\addPathsToUserEnvVariables-gazebo.ps1'

if ((Test-Path $gazeboScript)) {
  Invoke-Expression $gazeboScript
}
