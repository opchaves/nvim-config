# AGENTS.md

Guidance for coding agents working in this Neovim configuration repository.

## Repository Snapshot

- Language: Lua
- Runtime: Neovim (0.10+ supported, 0.11+ preferred)
- Plugin manager: `lazy.nvim`
- LSP installer: `mason.nvim` + `mason-lspconfig.nvim`
- Scope: editor config only (no app/server build pipeline)

## Rule Files Check

The following rule files were checked and are **not present**:

- `.cursorrules`
- `.cursor/rules/`
- `.github/copilot-instructions.md`

If any of these are added later, treat them as higher-priority constraints.

## Project Structure

- `init.lua`: entrypoint; bootstraps lazy and imports config modules.
- `lua/config/options.lua`: core `vim.opt` editor settings.
- `lua/config/keymaps.lua`: global keymaps.
- `lua/config/autocmds.lua`: autocommands and augroups.
- `lua/plugins/*.lua`: lazy.nvim plugin specs and plugin setup.
- `lazy-lock.json`: plugin version lockfile.

## Setup / Sync Commands

Run from repository root: `/Users/opchav/.config/nvim`.

```bash
# Sync plugins to lockfile / specs
nvim --headless "+Lazy! sync" +qa

# Update plugins and refresh lockfile
nvim --headless "+Lazy! update" +qa

# Run lazy health checks
nvim --headless "+Lazy! health" +qa

# Install configured LSP servers via Mason
nvim --headless "+MasonInstall ts_ls eslint html cssls jsonls" +qa
```

## Lint / Format Commands

There is currently no dedicated lint or test framework in-repo.

Use these practical checks:

```bash
# Parse-check all Lua files (syntax only)
find . -name "*.lua" -print0 | xargs -0 -n1 luac -p

# Optional formatting, if stylua is installed
stylua .
```

If `stylua` is introduced, add a config file (`stylua.toml`) and pin behavior.

## Test Commands (Smoke Tests)

This repo has no unit/integration test suite today.

Use headless Neovim smoke tests to validate config loads:

```bash
# Full config startup smoke test
nvim --headless "+qa"

# Explicitly load key modules
nvim --headless "+lua require('config.options')" +qa
nvim --headless "+lua require('config.keymaps')" +qa
nvim --headless "+lua require('config.autocmds')" +qa
```

### Single-test equivalent (most important)

When asked to run a “single test”, use a single-module load or single plugin check:

```bash
# Single module check
nvim --headless "+lua require('plugins.lsp')" +qa

# Single feature check (example: colorscheme)
nvim --headless "+colorscheme tokyonight-night" +qa
```

Interpretation: in this repo, a “single test” means a targeted headless startup
path validating one module/feature, since formal tests do not yet exist.

## Code Style Guidelines

Follow existing style in this repository unless explicitly asked otherwise.

### Lua module conventions

- Each config/plugin file returns a table when used as a module.
- Plugin specs follow lazy.nvim table format: `{ "plugin/name", ... }`.
- Keep files focused: one concern per file (`options`, `keymaps`, etc.).

### Imports / requires

- Use `local x = require("module")` near first use in config blocks.
- Do not create unused local requires.
- Prefer explicit module names over dynamic string concatenation.

### Formatting

- 2-space indentation.
- Keep trailing commas in multiline Lua tables.
- Prefer double quotes consistently (matches current codebase).
- Keep functions short and scoped to the smallest needed block.

### Naming conventions

- Local helpers: short and descriptive (`map`, `opt`, `group`, `servers`).
- Module filenames: lowercase, purpose-based (`lsp.lua`, `cmp.lua`).
- Augroup names: stable, readable identifiers.
- Keymap descriptions: imperative and concise (`"Go to definition"`).

### Types / data shape discipline

- Use predictable table shapes for plugin specs and server maps.
- Build shared option tables once, then merge per-target overrides.
- For per-server LSP settings, keep `servers` map as source of truth.

### Error handling and compatibility

- Prefer compatibility guards for version-dependent APIs.
  - Example: Neovim 0.11 `vim.lsp.config/enable` with 0.10 fallback.
- Avoid hard failures for optional functionality unless required.
- When external tools are required (Mason packages), document install command.

### Keymaps and UX behavior

- Always include `desc` in keymaps for discoverability.
- Buffer-local LSP keymaps should be set in `on_attach`.
- Keep global mappings in `lua/config/keymaps.lua` unless feature-local.

### Comments and documentation

- Add comments only where behavior is non-obvious.
- Prefer brief intent comments over narrating obvious code.
- Do not add banner comments or noisy section dividers.

## Change Management Expectations for Agents

- Do not introduce broad refactors without user request.
- Preserve user-established behavior and keybindings.
- Keep plugin lazy-loading intent intact unless there is a clear reason.
- Update `lazy-lock.json` only when plugin versions actually change.
- After edits, run at least one relevant headless smoke command.

## Recommended Validation Matrix After Changes

Run the smallest useful set:

```bash
# 1) Syntax safety
find . -name "*.lua" -print0 | xargs -0 -n1 luac -p

# 2) Startup safety
nvim --headless "+qa"

# 3) Plugin graph consistency
nvim --headless "+Lazy! sync" +qa
```

For LSP-related edits, also run:

```bash
nvim --headless "+MasonInstall ts_ls eslint html cssls jsonls" +qa
```

## When Unsure

- Choose minimal, reversible changes.
- Match existing conventions in nearby files.
- Prefer compatibility and clarity over cleverness.
