#Requires -version 3
#Requires -RunAsAdministrator

[Environment]::SetEnvironmentVariable("M2_HOME", "$PWD");

Write-Host "M2_HOME : " (Get-ChildItem Env:\M2_HOME).value