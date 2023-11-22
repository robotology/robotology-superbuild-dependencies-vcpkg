$installerRootPath = (Split-Path -parent (Split-Path -Path $PSCommandPath));

# Call the script to cleanup the env variables of vcpkg 
$vcpkgTriplet = 'x64-windows';
$vcpkgScript = $installerRootPath + '\scripts\removePathsFromUserEnvVariables-vcpkg.ps1'
Invoke-Expression $vcpkgScript
