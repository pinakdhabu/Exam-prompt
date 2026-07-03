<#
.SYNOPSIS
  Detect which AI coding agent is running
.DESCRIPTION
  Cross-platform agent detection for 20+ AI coding agents as of June 2026.
.PARAMETER Json
  Output JSON with all details
.PARAMETER All
  List all detected agents
.EXAMPLE
  .\scripts\detect-agent.ps1
  .\scripts\detect-agent.ps1 -Json
  .\scripts\detect-agent.ps1 -All
#>

param(
  [switch]$Json,
  [switch]$All
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)

$agents = @{
  opencode = @{name = "OpenCode"; type = "terminal-native"; indicators = @(
    @{path = Join-Path $RepoRoot ".opencode"; label = "dir_exists:.opencode"}
  )}
  "claude-code" = @{name = "Claude Code"; type = "terminal-native"; indicators = @(
    @{path = "$RepoRoot\.claude\settings.json"; label = "config_exists:.claude/settings.json"}
    @{path = "$RepoRoot\CLAUDE.md"; label = "file_exists:CLAUDE.md"}
  )}
  "codex-cli" = @{name = "Codex CLI"; type = "terminal-native"; indicators = @(
    @{path = "$RepoRoot\.codex"; label = "dir_exists:.codex"}
  )}
  "gemini-cli" = @{name = "Gemini CLI / Antigravity"; type = "terminal-native"; indicators = @(
    @{path = "$RepoRoot\.antigravity"; label = "dir_exists:.antigravity"}
    @{path = "$RepoRoot\.gemini"; label = "dir_exists:.gemini"}
  )}
  "grok-build" = @{name = "Grok Build"; type = "terminal-native"; indicators = @(
    @{path = "$RepoRoot\.grok"; label = "dir_exists:.grok"}
  )}
  aider = @{name = "Aider"; type = "terminal-native"; indicators = @(
    @{path = "$RepoRoot\.aider.conf.yml"; label = "file_exists:.aider.conf.yml"}
  )}
  cursor = @{name = "Cursor"; type = "ide-fork"; indicators = @(
    @{path = "$RepoRoot\.cursor\rules"; label = "dir_exists:.cursor/rules"}
  )}
  windsurf = @{name = "Windsurf"; type = "ide-fork"; indicators = @(
    @{path = "$RepoRoot\.windsurfrules"; label = "file_exists:.windsurfrules"}
  )}
  "void-ai" = @{name = "Void AI"; type = "ide-fork"; indicators = @(
    @{path = Join-Path $RepoRoot ".void"; label = "dir_exists:.void"}
  )}
  cline = @{name = "Cline"; type = "vscode-ext"; indicators = @(
    @{path = "$RepoRoot\.clinerules"; label = "file_exists:.clinerules"}
    @{path = "$RepoRoot\cline_docs"; label = "dir_exists:cline_docs"}
  )}
  "roo-code" = @{name = "Roo Code"; type = "vscode-ext"; indicators = @(
    @{path = "$RepoRoot\.roorules"; label = "file_exists:.roorules"}
    @{path = "$RepoRoot\roo_docs"; label = "dir_exists:roo_docs"}
  )}
  "kilo-code" = @{name = "Kilo Code"; type = "vscode-ext"; indicators = @(
    @{path = "$RepoRoot\.kilorules"; label = "file_exists:.kilorules"}
    @{path = "$RepoRoot\kilo_docs"; label = "dir_exists:kilo_docs"}
  )}
  kiro = @{name = "Kiro"; type = "vscode-ext"; indicators = @(
    @{path = "$RepoRoot\.kiro"; label = "dir_exists:.kiro"}
  )}
  "continue-dev" = @{name = "Continue.dev"; type = "vscode-ext"; indicators = @(
    @{path = "$RepoRoot\.continue"; label = "dir_exists:.continue"}
  )}
  goose = @{name = "Goose"; type = "vscode-ext"; indicators = @(
    @{path = "$RepoRoot\.goose"; label = "dir_exists:.goose"}
  )}
  copilot = @{name = "GitHub Copilot"; type = "cloud"; indicators = @(
    @{path = "$RepoRoot\.github\copilot-instructions.md"; label = "file_exists:.github/copilot-instructions.md"}
  )}
  codegen = @{name = "Codegen"; type = "cloud"; indicators = @(
    @{path = "$RepoRoot\.codegen"; label = "dir_exists:.codegen"}
  )}
  devin = @{name = "Devin"; type = "cloud"; indicators = @(
    @{path = "$RepoRoot\.devin"; label = "dir_exists:.devin"}
  )}
  "sourcegraph-amp" = @{name = "Sourcegraph Amp"; type = "cloud"; indicators = @(
    @{path = "$RepoRoot\.amp"; label = "dir_exists:.amp"}
  )}
  fabrik = @{name = "Fabrik"; type = "cloud"; indicators = @(
    @{path = "$RepoRoot\.fabrik"; label = "dir_exists:.fabrik"}
  )}
}

$results = @()
foreach ($agentId in $agents.Keys) {
  $agent = $agents[$agentId]
  $confidence = 0
  $clues = @()
  foreach ($indicator in $agent.indicators) {
    if (Test-Path $indicator.path) {
      $confidence += 3
      $clues += $indicator.label
    }
  }
  $results += [PSCustomObject]@{
    id = $agentId
    name = $agent.name
    type = $agent.type
    detected = $confidence -gt 0
    confidence = $confidence
    clues = $clues
  }
}

$results = $results | Sort-Object confidence -Descending
$primary = $results | Where-Object { $_.detected -eq $true } | Select-Object -First 1

if ($Json) {
  $output = @{
    detected_agents = @($results | Where-Object { $_.detected } | ForEach-Object {
      @{id=$_.id; name=$_.name; type=$_.type; confidence=$_.confidence; clues=$_.clues}
    })
    primary_agent = if ($primary) { $primary.id } else { $null }
    primary_agent_name = if ($primary) { $primary.name } else { $null }
    all_agents = @{}
  }
  foreach ($r in $results) {
    $output.all_agents[$r.id] = @{name=$r.name; type=$r.type; detected=$r.detected; confidence=$r.confidence; clues=$r.clues}
  }
  Write-Output ($output | ConvertTo-Json -Depth 5)
} elseif ($All) {
  foreach ($r in $results) {
    $status = if ($r.detected) { "ACTIVE" } else { "---" }
    $cluesStr = if ($r.clues.Count -gt 0) { $r.clues -join ", " } else { "none" }
    Write-Host ("{0,-8} {1,-30} conf={2,2} type={3,-16} [{4}]" -f $status, $r.name, $r.confidence, $r.type, $cluesStr)
  }
} else {
  if ($primary) { Write-Output $primary.name } else { Write-Output "unknown" }
}
