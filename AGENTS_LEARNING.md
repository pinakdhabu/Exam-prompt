# AGENTS Learning Log

> Cross-session memory for AI agents working on this repo. When you discover a non-obvious pattern,
> fix a bug caused by missing context, or learn something future agents should know — record it
> here.
>
> Format: `YYYY-MM-DD | Agent | What happened → What to do instead`

## Entries

<!-- Add new entries at the TOP of this list -->

| Date       | Agent    | Lesson                                                                                                                                                                                                                                             |
| ---------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2026-07-02 | OpenCode | `package.json` had duplicate `"test"` keys and a missing comma — `npm test` was completely broken. Always validate JSON with `node -e "require('./package.json')"` before assuming scripts work.                                                   |
| 2026-07-02 | OpenCode | `infrastructure/` has 4 powerful tools (output-validator.js, skill-router.js, session-context.js, cache-manager.js) that are NOT referenced in any agent-facing config. Always check `infrastructure/` and wire it into `llms.txt` and `Makefile`. |
| 2026-07-02 | OpenCode | Multiple files still referenced "24 skills" after the repo grew to 30. Always do a full-text grep for stale numbers after count changes. Found in: UBIQUITOUS_LANGUAGE.md, cline_docs/, deps/, .cursor/rules/.                                     |

## Patterns

<!-- Reusable patterns discovered across sessions -->

- **Number freshness**: After any count change (skills, subjects, universities), grep the whole repo
  for the old number.
- **Infrastructure discovery**: Always check `infrastructure/`, `bin/`, `scripts/` for tools not yet
  wired into agent configs.
- **JSON validation**: Run `node -e "require('./path.json')"` after editing JSON files to catch
  syntax errors immediately.
