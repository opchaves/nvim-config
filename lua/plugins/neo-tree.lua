return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>fe", "<cmd>Neotree focus left<cr>", desc = "Focus file tree" },
    { "<leader>fE", "<cmd>Neotree toggle left<cr>", desc = "Toggle file tree" },
  },
  opts = {
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["<leader>fe"] = function()
          vim.cmd("wincmd p")
        end,
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
    },
  },
}
