vim.g.mapleader = '<space>'
vim.g.maplocalleader = '<space>'
require("config.lazy")

vim.cmd "colorscheme tokyonight"

vim.opt.number = true             -- show line numbers

vim.opt.tabstop = 2               -- a tab is two spaces
vim.opt.softtabstop = 2           -- a tab is two spaces in insert
vim.opt.shiftwidth = 2            -- an autoindent (with <<) is two spaces
vim.opt.expandtab = true          -- use spaces, not tabs
vim.opt.smartindent = true        -- use smart autoindent

vim.opt.wrap = false              -- don't wrap lines

vim.opt.swapfile = false          -- don't use a swapfile
vim.opt.backup = false            -- don't use a backup
vim.opt.undofile = true           -- use an undo file instead

vim.opt.ignorecase = true         -- ignore casing in searches
vim.opt.smartcase = true          -- enable casing in searches if there is an upper case letter in the search

vim.opt.list = true               -- show invisible characters (tabs and trailing spaces)

vim.opt.termguicolors = true      -- enables 24-bit RGB colors

vim.opt.scrolloff = 4             -- always show 4 lines above and below
vim.opt.sidescrolloff = 4         -- always show 4 columns left and right

vim.opt.autowrite = true          -- write when buffers are changed
vim.opt.clipboard = "unnamedplus" -- use systsem clipboard

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>xl", ":.lua<CR>")
vim.keymap.set("v", "<space>xl", ":lua<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gsh", vim.lsp.buf.signature_help)

vim.keymap.set("n", "<C-t>", ":tabnew<CR>")

-- Highlight when yanking text
-- See `:help vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 300 }
  end,
})

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
