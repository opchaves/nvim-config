return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "AerialToggle",
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle symbol outline" },
      { "<leader>fa", "<cmd>Telescope aerial<CR>", desc = "Find symbols" },
    },
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },
    config = function(_, opts)
      require("aerial").setup(opts)
    end,
  },
}
