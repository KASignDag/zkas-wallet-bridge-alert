# ZKas Wallet Bridge Alert v0.1.1

- Persists bridge-down state in `state.json`.
- Sends `✅ Bridge recovered` after the alert process or PC restarts while the bridge is down.
- Clears persisted outage state once the bridge responds again.
- Includes a reboot/restart recovery regression test.
