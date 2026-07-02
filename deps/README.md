# Dependencies

Auto-detection and resolution system for project dependencies.

- `resolve.sh` — Scans project (package.json, requirements.txt, scripts), detects your OS and
  package manager, checks what's installed, outputs `manifest.json` with installed/missing/health
  status.
- `manifest.json` — Machine-readable dependency report for AI agents.
- `session-profile.json` — User session profile with tool preferences.

Run `bash deps/resolve.sh --install` to auto-install missing dependencies.
