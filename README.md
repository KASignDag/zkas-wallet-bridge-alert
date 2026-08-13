# ZKas Wallet Bridge Alert

## Unofficial Community Tool

**ZKas Wallet Bridge Alert is an independent, community-developed utility. It is not affiliated with, endorsed by, sponsored by, or maintained by the ZKas project or its developers.**

This repository is the **ZKas Desktop Wallet bridge** edition of the alert monitor.

It is intended for the managed KAS + ZKAS mining bridge started by the ZKas Desktop Wallet and uses the wallet bridge dashboard/API endpoint:

`http://127.0.0.1:18114`

The separate repository **`KASignDag/zkas-dual-alert`** remains the edition for standalone/manual Windows bridge setups.

## What this tool does

- Monitors the wallet-managed bridge read-only
- Detects ZKAS block events
- Detects KAS block events
- Sends bridge offline/recovered alerts
- Supports Email and Discord notifications
- Uses JSON `/api/stats` first with Prometheus `/metrics` fallback
- Does not use seed phrases, private keys, spending access, node control, or miner control

## Target bridge

- ZKas Desktop Wallet managed bridge
- `solo-dual-bridge v1.0.7` compatible telemetry
- Default dashboard/API: `http://127.0.0.1:18114`

## Status

Initial wallet-specific edition is being prepared from the proven ZKas Dual Alert v0.2.2 monitor core.

## License

MIT
