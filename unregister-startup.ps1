#Requires -RunAsAdministrator
param(
    [string]$InstallDir = "$env:ProgramData\ZKasWalletBridgeAlert"
)
$ErrorActionPreference = "Stop"
Stop-ScheduledTask -TaskName "ZKas Wallet Bridge Alert" -ErrorAction SilentlyContinue
Unregister-ScheduledTask -TaskName "ZKas Wallet Bridge Alert" -Confirm:$false -ErrorAction SilentlyContinue
Write-Host "Removed startup task: ZKas Wallet Bridge Alert (Unofficial Community Tool)"
