# MCP Server Setup

This guide helps you expose the Exam Prompt system as an
[MCP (Model Context Protocol)](https://modelcontextprotocol.io) server, making all university skills
available to any MCP-compatible AI agent (Claude Desktop, Cursor, VS Code, etc.).

## Option 1: Filesystem MCP (Recommended)

The simplest approach — point your MCP client to the `skills/` directory so the AI can read all
SKILL.md files.

### Claude Desktop

Edit `~/Library/Application Support/Claude/claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "exam-prompt": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/absolute/path/to/Exam-prompt/skills",
        "/absolute/path/to/Exam-prompt/universities",
        "/absolute/path/to/Exam-prompt/pyq-index"
      ]
    }
  }
}
```

### VS Code (Cline, Continue)

Add to your MCP settings:

```json
{
  "mcpServers": {
    "exam-prompt": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/absolute/path/to/Exam-prompt/skills",
        "/absolute/path/to/Exam-prompt/universities"
      ],
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

## Option 2: Custom MCP Server (Advanced)

For agents that need structured access (search PYQs, query university configs, etc.):

```bash
npm install -g exam-prompt-mcp
exam-prompt-mcp --skills-dir /path/to/Exam-prompt
```

Or run directly with npx:

```json
{
  "mcpServers": {
    "exam-prompt": {
      "command": "npx",
      "args": ["exam-prompt-mcp", "--skills-dir", "/path/to/Exam-prompt"]
    }
  }
}
```

## Option 3: OpenAI-compatible API

Start a local API server that exposes skills as tools:

```bash
node scripts/mcp-server.js
```

Then configure any MCP client to connect to `http://localhost:3100`.

## Available Tools

| Tool                       | Description                            |
| -------------------------- | -------------------------------------- |
| `list_skills`              | List all 26 exam prep skills           |
| `get_skill`                | Read a specific SKILL.md by name       |
| `list_universities`        | List all configured universities       |
| `get_university_config`    | Get a university's config.json         |
| `list_university_branches` | List branches for a university         |
| `get_subjects`             | Get subject list for a branch/semester |
| `detect_university`        | Auto-detect university from context    |
| `get_session_profile`      | Read current session config            |

## Auto-Discovery

The system auto-discovers:

- **Skills**: From `skills/*/SKILL.md` (26 total)
- **Universities**: From `universities/*/config.json`
- **Patterns**: From `universities/*/patterns/*.json`
- **Branches**: From `universities/*/branches/*/subjects.json`
- **PYQs**: From `universities/*/PYQs/` and `pyq-downloads/`
