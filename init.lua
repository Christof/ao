require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>xl", ":.lua<CR>")
vim.keymap.set("v", "<space>xl", ":lua<CR>")

-- Highlight when yanking text
-- See `:help vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank {higroup='Visual', timeout=300}
  end,
})

