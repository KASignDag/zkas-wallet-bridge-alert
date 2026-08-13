import json
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import monitor as alert_monitor


class RecoveryPersistenceTests(unittest.TestCase):
    def test_recovery_alert_survives_process_restart(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            config = root / "config.json"
            state = root / "state.json"
            config.write_text(json.dumps({
                "bridge": {"base_url": "http://127.0.0.1:18114", "poll_seconds": 5, "down_after_failures": 1},
                "alerts": {"bridge_down": True, "bridge_recovered": True},
                "notifications": {"console": {"enabled": True}},
                "state_file": "state.json"
            }), encoding="utf-8")
            state.write_text(json.dumps({
                "seen": [], "reward_seen": [], "counts": {"ZKAS": 0, "KAS": 0}, "bridge_down": True
            }), encoding="utf-8")

            snap = alert_monitor.Snapshot(0, 0, [], [], active_workers=2, total_shares=17, bridge_uptime=232, source="json")
            sent = []

            with patch.object(alert_monitor.BridgeSource, "fetch", return_value=snap), patch.object(
                alert_monitor,
                "notify_all",
                side_effect=lambda n, subject, body: sent.append((subject, body)) or [],
            ):
                rc = alert_monitor.monitor(config, once=True)

            self.assertEqual(rc, 0)
            self.assertTrue(any(subject == "✅ Bridge recovered" for subject, _ in sent))
            saved = json.loads(state.read_text(encoding="utf-8"))
            self.assertFalse(saved["bridge_down"])


if __name__ == "__main__":
    unittest.main()
