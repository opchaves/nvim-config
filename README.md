# Neovim Config

Personal Neovim configuration focused on a fast JavaScript/TypeScript web workflow.

## Highlights

- Plugin management with `lazy.nvim`
- LSP setup via `mason.nvim` + `mason-lspconfig.nvim`
- Completion via `nvim-cmp` + LuaSnip
- Formatting via `conform.nvim` + Prettier
- Fuzzy finding via Telescope
- Syntax/indent via Treesitter
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

Core:

- `,w` save file
- `,q` quit window
- `,h` clear search highlight

Telescope:

- `,ff` find files
- `,fg` live grep
- `,fb` list buffers
- `,fh` help tags

Formatting:

- `,f` format current buffer

LSP (buffer-local when server attaches):

- `gd` go to definition
- `gr` go to references
- `K` hover docs
- `,rn` rename symbol
- `,ca` code action

Buffer navigation:

- Existing mappings like `[b` and `]b` are preserved
- Bufferline provides the top bar UI for open buffers

## Language Tooling

Configured LSP servers:

- `ts_ls`
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
nvim --headless "+MasonInstall ts_ls eslint html cssls jsonls prettier" +qa
```

Health checks:

```bash
nvim --headless "+Lazy! health" +qa
```

Lua syntax check:

```bash
find . -name "*.lua" -print0 | xargs -0 -n1 luac -p
```

## Notes

- LSP config supports Neovim 0.11 API (`vim.lsp.config/enable`) with 0.10 fallback.
- `lazy-lock.json` should be committed whenever plugin versions change.
- Keep plugin specs modular: one concern per file in `lua/plugins/`.
