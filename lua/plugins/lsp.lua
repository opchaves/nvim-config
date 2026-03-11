return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      -- Add completion capabilities so nvim-cmp can consume LSP suggestions.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason_lspconfig.setup({
        ensure_installed = {
          "ts_ls",
          "eslint",
          "html",
          "cssls",
          "jsonls",
        },
      })

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gr", vim.lsp.buf.references, "Go to references")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
      end

      local servers = {
        ts_ls = {},
        eslint = {},
        html = {},
        cssls = {},
        jsonls = {},
      }

      local shared = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      if vim.lsp.config and vim.lsp.enable then
        -- Neovim 0.11+ API.
        for server, opts in pairs(servers) do
          vim.lsp.config(server, vim.tbl_deep_extend("force", shared, opts))
          vim.lsp.enable(server)
        end
      else
        -- Backward-compatible path for Neovim 0.10.x.
        local lspconfig = require("lspconfig")
        for server, opts in pairs(servers) do
          lspconfig[server].setup(vim.tbl_deep_extend("force", shared, opts))
        end
      end
    end,
  },
}
