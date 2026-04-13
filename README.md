# Neovim Config

Personal Neovim configuration focused on a fast JavaScript/TypeScript web workflow.

## Highlights

- Plugin management with `lazy.nvim`
- LSP setup via `mason.nvim` + `mason-lspconfig.nvim`
- Completion via `nvim-cmp` + LuaSnip
- AI suggestions via GitHub Copilot (`copilot.lua`)
- Formatting via `conform.nvim` + Prettier
- Fuzzy finding via Telescope
- Syntax/indent via Treesitter
- Git signs/blame/hunks via Gitsigns
- Symbol outline via Aerial
- Buffer UI via Bufferline
- Theme: Tokyo Night (`tokyonight-night`)

## Requirements

- Neovim 0.10+ (0.11+ recommended)
- Git
- A Nerd Font (recommended for file icons)
- Node.js/npm (for Prettier via Mason)

## Install

Clone this repo as your Neovim config:

```bash
git clone <your-repo-url> ~/.config/nvim
```

Start Neovim once to bootstrap plugins:

```bash
nvim
```

Or run sync headlessly:

```bash
nvim --headless "+Lazy! sync" +qa
```

## Key Defaults

- Leader key: `,`
- Local leader key: `,`
- Relative numbers enabled
- Clipboard uses system clipboard (`unnamedplus`)

## Keymaps

Global keymaps:

| Mode | Key | Description |
| --- | --- | --- |
| `n` | `,w` | Save file |
| `n` | `,q` | Quit window |
| `n` | `,h` | Clear search highlight |
| `n` | `,bd` | Delete current buffer |
| `n` | `,bn` | Go to next buffer |
| `n` | `,bp` | Go to previous buffer |
| `n` | `,bo` | Delete all buffers except current |
| `n` | `,ba` | Delete all buffers |
| `n` | `,e` | Show diagnostics under cursor |
| `n` | `,dn` | Go to next diagnostic |
| `n` | `,dp` | Go to previous diagnostic |
| `n` | `,dl` | Put diagnostics in location list |
| `n` | `,a` | Toggle symbol outline (Aerial) |
| `n` | `,fa` | Telescope: find symbols (Aerial) |
| `n` | `,ff` | Telescope: find files |
| `n` | `,fg` | Telescope: live grep |
| `n` | `,fb` | Telescope: list buffers |
| `n` | `,fh` | Telescope: help tags |
| `n` | `,f` | Format current buffer |

Copilot suggestion keymaps (insert mode):

| Mode | Key | Description |
| --- | --- | --- |
| `i` | `Ctrl-j` | Accept Copilot suggestion |
| `i` | `Ctrl-]` | Dismiss Copilot suggestion |

Gitsigns buffer-local keymaps (active in git-tracked buffers):

| Mode | Key | Description |
| --- | --- | --- |
| `n` | `]h` | Next hunk |
| `n` | `[h` | Previous hunk |
| `n` | `,gs` | Stage hunk |
| `n` | `,gr` | Reset hunk |
| `n` | `,gh` | Preview hunk diff |
| `n` | `,gb` | Toggle inline blame |

Aerial buffer-local keymaps (active when the outline panel is open):

| Mode | Key | Description |
| --- | --- | --- |
| `n` | `{` | Previous symbol |
| `n` | `}` | Next symbol |

LSP buffer-local keymaps (active when an LSP server attaches):

| Mode | Key | Description |
| --- | --- | --- |
| `n` | `gd` | Go to definition |
| `n` | `gr` | Go to references |
| `n` | `K` | Hover docs |
| `n` | `,rn` | Rename symbol |
| `n,v` | `,ca` | Code action |

## Language Tooling

Configured LSP servers:

- `vtsls`
- `eslint`
- `html`
- `cssls`
- `jsonls`

Configured formatter:

- `prettier` (JS/TS/TSX/JSX/CSS/HTML/JSON/YAML/Markdown)

## Project Layout

- `init.lua` entrypoint and lazy bootstrap
- `lua/config/options.lua` editor options
- `lua/config/keymaps.lua` global keymaps
- `lua/config/autocmds.lua` autocommands
- `lua/plugins/*.lua` plugin specs/config
- `lazy-lock.json` pinned plugin versions
- `AGENTS.md` instructions for coding agents

## Useful Commands

Sync/update plugins:

```bash
nvim --headless "+Lazy! sync" +qa
nvim --headless "+Lazy! update" +qa
```

Install Mason tools:

```bash
nvim --headless "+MasonInstall vtsls eslint html cssls jsonls prettier" +qa
```

Health checks:

```bash
nvim --headless "+Lazy! health" +qa
```

Lua syntax check:

```bash
find . -name "*.lua" -print0 | xargs -0 -n1 luac -p
```

Format Lua (optional):

```bash
stylua .
```

## Notes

- LSP config supports Neovim 0.11 API (`vim.lsp.config/enable`) with 0.10 fallback.
- `lazy-lock.json` should be committed whenever plugin versions change.
- Keep plugin specs modular: one concern per file in `lua/plugins/`.
- `.editorconfig` defines consistent whitespace, line endings, and indentation defaults.
- `stylua.toml` pins Lua formatting behavior for consistent code style.
