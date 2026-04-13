return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(hl, c)
        -- Make floating windows (e.g. LSP hover) distinguishable from the editor background.
        hl.NormalFloat = { bg = c.bg_highlight }
        hl.FloatBorder = { fg = c.blue, bg = c.bg_highlight }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}
