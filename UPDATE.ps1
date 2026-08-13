#Requires -RunAsAdministrator
param(
    [string]$InstallDir = "$env:ProgramData\ZKasWalletBridgeAlert"
)
$ErrorActionPreference = "Stop"
& "$PSScriptRoot\INSTALL.ps1" -InstallDir $InstallDir
