$installerRootPath = (Split-Path -parent (Split-Path -Path $PSCommandPath));

# Call the script to cleanup the env variables of vcpkg 
$vcpkgTriplet = 'x64-windows';
$vcpkgScript = $installerRootPath + '\scripts\removePathsFromUserEnvVariables-vcpkg.ps1'
Invoke-Expression $vcpkgScript

# Call the script to cleanup the env variables of gazebo 
$gazeboScript = $installerRootPath + '\scripts\removePathsFromUserEnvVariables-gazebo.ps1'
if ((Test-Path $gazeboScript)) {
  Invoke-Expression $gazeboScript
}