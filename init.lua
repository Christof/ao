require("config.lazy")

vim.cmd "colorscheme tokyonight"

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>xl", ":.lua<CR>")
vim.keymap.set("v", "<space>xl", ":lua<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gsh", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>", vim.lsp.buf.definition)

-- Highlight when yanking text
-- See `:help vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank {higroup='Visual', timeout=300}
  end,
})

