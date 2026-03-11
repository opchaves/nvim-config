# Keymaps

Reference for custom keymaps in this config.

- Leader key: `,`
- Local leader key: `,`

## Global Keymaps

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
| `n` | `,ff` | Telescope: find files |
| `n` | `,fg` | Telescope: live grep |
| `n` | `,fb` | Telescope: list buffers |
| `n` | `,fh` | Telescope: help tags |
| `n` | `,f` | Format current buffer |

## LSP Buffer-Local Keymaps

These are only active in buffers where an LSP server is attached.

| Mode | Key | Description |
| --- | --- | --- |
| `n` | `gd` | Go to definition |
| `n` | `gr` | Go to references |
| `n` | `K` | Hover documentation |
| `n` | `,rn` | Rename symbol |
| `n,v` | `,ca` | Code action |

## Sources

- `lua/config/keymaps.lua`
- `lua/plugins/lsp.lua`
- `lua/plugins/format.lua`
