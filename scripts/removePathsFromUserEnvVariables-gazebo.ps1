# Remove a given "User" enviromental variable
function Remove-UserEnvVariable ($EnvVariable, $Verbose=$TRUE) {
  if ($Verbose) {
    Write-Host 'Removing ' $EnvVariable ' User enviroment variable.'
  }
  [System.Environment]::SetEnvironmentVariable($EnvVariable, $null, 'User');
}

# Remove a value from a given "User" enviromental variable
function Remove-ValueFromUserEnvVariable ($EnvVariable, $Value, $Verbose=$TRUE) {
  if ($Verbose) {
    Write-Host 'Removing ' $Value ' from the ' $EnvVariable ' User enviroment variable.'
  }
  $currVar = [System.Environment]::GetEnvironmentVariable($EnvVariable, 'User');
  # If the env variable is already empty, do not do anything
  if (-Not [string]::IsNullOrEmpty($currVar)) {
    $newVar = ($currVar.Split(';') | Where-Object { $_ -ne $Value }) -join ';';
    # If the resulting final variable is empty, delete the enviromental variable
    if ([string]::IsNullOrEmpty($newVar)) {
      [System.Environment]::SetEnvironmentVariable($EnvVariable, $null, 'User');
    } else {
      [System.Environment]::SetEnvironmentVariable($EnvVariable, $newVar, 'User');
    }
  }
}

$parentPath = Split-Path -Path $PSCommandPath;
$vcpkgTriplet = 'x64-windows';
$vcpkgInstallDir = (Split-Path -parent $parentPath) + '\vcpkg\installed\' + $vcpkgTriplet;

$gazeboInstallDir = (Split-Path -parent $parentPath) + '\gazebo\install';
$gazeboMajorVersion = '11';

# This logic mimics part of the logic contained in share\gazebo\setup.bat 
Remove-UserEnvVariable HOME;
Remove-UserEnvVariable GAZEBO_MASTER_URI;
Remove-UserEnvVariable GAZEBO_MODEL_DATABASE_URI;
Remove-ValueFromUserEnvVariable GAZEBO_RESOURCE_PATH ($gazeboInstallDir + '\share\gazebo-' + $gazeboMajorVersion);
Remove-ValueFromUserEnvVariable GAZEBO_PLUGIN_PATH ($gazeboInstallDir + '\bin\gazebo-' + $gazeboMajorVersion + '\plugins');
Remove-ValueFromUserEnvVariable GAZEBO_MODEL_PATH ($gazeboInstallDir + '\share\gazebo-' + $gazeboMajorVersion + '\models');
Remove-ValueFromUserEnvVariable PATH ($gazeboInstallDir + '\bin\gazebo-' + $gazeboMajorVersion + '\plugins');
Remove-UserEnvVariable OGRE_RESOURCE_PATH;

# Also add the bin to the path directly (not present in share\gazebo\setup.bat)
Remove-ValueFromUserEnvVariable PATH ($gazeboInstallDir + "\bin");