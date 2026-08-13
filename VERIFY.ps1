param(
    [string]$InstallDir = "$env:ProgramData\ZKasWalletBridgeAlert"
)
$ErrorActionPreference = "Continue"

Write-Host "ZKas Wallet Bridge Alert - Unofficial Community Tool verification"
Write-Host "Install: $InstallDir"
Write-Host ""

$task = Get-ScheduledTask -TaskName "ZKas Wallet Bridge Alert" -ErrorAction SilentlyContinue
if ($task) {
    $info = Get-ScheduledTaskInfo -TaskName "ZKas Wallet Bridge Alert"
    Write-Host "Task: $($task.State) | Last result: $($info.LastTaskResult)"
} else {
    Write-Host "Task: NOT INSTALLED"
}

$web = Get-NetTCPConnection -LocalPort 3041 -State Listen -ErrorAction SilentlyContinue | Select-Object -First 1
Write-Host ("Web 3041: " + $(if ($web) {"LISTENING (PID $($web.OwningProcess))"} else {"NOT LISTENING"}))

$bridge = Get-NetTCPConnection -LocalPort 18114 -State Listen -ErrorAction SilentlyContinue | Select-Object -First 1
Write-Host ("Wallet bridge 18114: " + $(if ($bridge) {"LISTENING"} else {"NOT LISTENING"}))

$log = Join-Path $InstallDir "data\alert.log"
if (Test-Path $log) {
    Write-Host ""
    Write-Host "Recent app log:"
    Get-Content $log -Tail 8
}
