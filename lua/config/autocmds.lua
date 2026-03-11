local group = vim.api.nvim_create_augroup("nvim_new", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    -- Brief visual confirmation that yank succeeded.
    vim.highlight.on_yank({ timeout = 150 })
  end,
})
