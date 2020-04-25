# Set a value to a given "User" enviromental variable
function Set-ValueToUserEnvVariable ($EnvVariable, $Value, $Verbose=$TRUE) {
  if ($Verbose) {
    Write-Host 'Set ' $Value ' to the ' $EnvVariable ' User enviroment variable.'
  }
  [System.Environment]::SetEnvironmentVariable($EnvVariable, $Value, 'User');
}

# Add a value to a given "User" enviromental variable
function Add-ValueToUserEnvVariable ($EnvVariable, $Value, $Verbose=$TRUE) {
  if ($Verbose) {
    Write-Host 'Appending ' $Value ' to the ' $EnvVariable ' User enviroment variable.'
  }
  $currVar = [System.Environment]::GetEnvironmentVariable($EnvVariable, 'User');
  # If the enviromental variable is currently empty, do not add an initial ";"
  if ([string]::IsNullOrEmpty($currVar)) {
    $newVar = $Value;
  } else {
    $newVar = $currVar + ';' + $Value;
  }
  [System.Environment]::SetEnvironmentVariable($EnvVariable, $newVar, 'User');
}

$parentPath = Split-Path -Path $PSCommandPath;
$vcpkgTriplet = 'x64-windows';
$vcpkgInstallDir = (Split-Path -parent $parentPath) + '\vcpkg\installed\' + $vcpkgTriplet;

$gazeboInstallDir = (Split-Path -parent $parentPath) + '\gazebo\install';
$gazeboMajorVersion = '11';

# This logic mimics part of the logic contained in share\gazebo\setup.bat 
Set-ValueToUserEnvVariable HOME ($env:HOMEDRIVE + $env:HOMEPATH);
Set-ValueToUserEnvVariable GAZEBO_MASTER_URI 'http://localhost:11345'
Set-ValueToUserEnvVariable GAZEBO_MODEL_DATABASE_URI 'http://models.gazebosim.org'
Add-ValueToUserEnvVariable GAZEBO_RESOURCE_PATH ($gazeboInstallDir + '\share\gazebo-' + $gazeboMajorVersion);
Add-ValueToUserEnvVariable GAZEBO_PLUGIN_PATH ($gazeboInstallDir + '\bin\gazebo-' + $gazeboMajorVersion + '\plugins');
Add-ValueToUserEnvVariable GAZEBO_MODEL_PATH ($gazeboInstallDir + '\share\gazebo-' + $gazeboMajorVersion + '\models');
Add-ValueToUserEnvVariable PATH ($gazeboInstallDir + '\bin\gazebo-' + $gazeboMajorVersion + '\plugins');
Set-ValueToUserEnvVariable OGRE_RESOURCE_PATH ($vcpkgInstallDir + '\bin');

# Also add the bin to the path directly (not present in share\gazebo\setup.bat)
Add-ValueToUserEnvVariable PATH ($gazeboInstallDir + "\bin");