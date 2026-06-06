# Active Context — Exam-Prompt

## Current State
The repo is complete with 24 skills, community infrastructure, CI/CD, rolling release, and agent configurations for all major AI coding platforms.

## Recent Changes
- Added 24 universal SKILL.md modules for all exam tasks
- Built community infrastructure (CONTRIBUTING.md, issue/PR templates, Discussions)
- Created rolling release system (self-update.sh, nightly-improve.yml)
- Added sample papers for FE/SE/TE/BE with solutions
- Built cross-platform setup scripts (Linux, macOS, Windows)
- Created QP fetcher (Node.js + Python) for auto-downloading PYQs
- Built student profile system (profile.sh)
- Created PYQ submission tool (submit-pyq.sh) for network effects
- Configured Dev Container for Codespaces
- Built GitHub Pages website (skill browser + app)
- Added agent configs for Claude Code, Cursor, Windsurf, Aider, Cline, Copilot, Continue.dev

## Current Focus
Making the repo optimized for AI coding agents — ensuring every major agent platform can auto-discover and load the 24 skills seamlessly.

## Open Questions
- Should we build the MCP server for real-time skill/PYQ querying?
- Should we add more sample papers for non-Computer Engineering branches?
- Should we create a Telegram bot for on-demand answer generation?

## Next Steps
1. Test the agent configs with each platform
2. Consider MCP server implementation
3. Grow community contributors via good-first-issue labels
