# ZKas Wallet Bridge Alert v0.1.0

## Unofficial Community Tool

**ZKas Wallet Bridge Alert is an independent, community-developed utility. It is not affiliated with, endorsed by, sponsored by, or maintained by the ZKas project or its developers.**

This repository is specifically for the **ZKas Desktop Wallet managed mining bridge**.

If you run the older standalone/manual Windows bridge instead, use the separate repository:

**`KASignDag/zkas-dual-alert`**

## Wallet edition defaults

- Wallet bridge dashboard/API: `http://127.0.0.1:18114`
- Alert setup UI: `http://127.0.0.1:3041`
- Install folder: `C:\ProgramData\ZKasWalletBridgeAlert`
- Scheduled Task: `ZKas Wallet Bridge Alert`
- Bridge telemetry target: ZKas Desktop Wallet `solo-dual-bridge v1.0.7` compatible `/api/stats` with `/metrics` fallback

The separate port, folder, and Scheduled Task name allow this wallet edition to remain distinct from the standalone Windows-bridge alert.

## What it does

- Read-only monitoring of the wallet-managed KAS + ZKAS bridge
- ZKAS block alerts
- KAS block alerts
- KAS reward alerts when reward data is exposed by the bridge
- Bridge offline and recovered alerts
- Gmail/SMTP email alerts
- Discord webhook alerts
- Safe **Simulate ZKAS Block** and **Simulate KAS Block** test buttons
- **Send Test Alert** with per-channel success/failure reporting
- Windows automatic startup
- JSON `/api/stats` first, Prometheus `/metrics` fallback
- Schema-tolerant v1.0.7 bridge parsing

It does **not** request or use seed phrases, private keys, spending access, node-control commands, or miner-control commands.

## Windows install

1. Download/extract the wallet-alert release ZIP.
2. Open PowerShell **as Administrator** in the extracted folder.
3. Run:

   `powershell -ExecutionPolicy Bypass -File .\INSTALL.ps1`

4. Open `http://127.0.0.1:3041`.
5. Login with `admin / 12345678`.
6. Change the default login password.
7. Configure Email, Discord, or both.
8. Save Settings and use the test/simulation buttons.

The default bridge address is already set to `http://127.0.0.1:18114` for the ZKas Desktop Wallet bridge.

## Verify installation

Run:

`powershell -ExecutionPolicy Bypass -File C:\ProgramData\ZKasWalletBridgeAlert\VERIFY.ps1`

The verification script checks the wallet-alert Scheduled Task, local setup UI on port `3041`, wallet bridge dashboard on port `18114`, and recent alert logs.

## Update

Extract a newer release and run its `UPDATE.ps1` as Administrator. The protected local `data` folder is preserved.

## Security

The setup UI binds to `127.0.0.1` by default. Do not expose port `3041` directly to the public Internet, especially while using the default password.

Notification credentials are stored locally under the protected Windows data folder. Public release packages must never include the installed `data` directory, `config.json`, `web_config.json`, `state.json`, alert logs, Discord webhooks, Gmail App Passwords, or other credentials.

## Compatibility

v0.1.0 is based on the proven parser/notification core from ZKas Dual Alert v0.2.2 and is targeted at the ZKas Desktop Wallet managed bridge using `solo-dual-bridge v1.0.7` compatible telemetry.

The parser intentionally accepts several field aliases so additive or renamed upstream fields are less likely to break monitoring, but compatibility cannot be guaranteed if the wallet bridge telemetry changes incompatibly in a future release.

## License

MIT
