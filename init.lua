local set = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('noice').setup()
require('notify')
require('nvim-tree').setup()

-- Set the behavior of tab
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.autoindent = true

-- Other Niceties
set.number = true
set.relativenumber = true
vim.cmd[[let g:lightline = {
\ 'colorscheme': 'spaceduck',
\ }]]
if vim.fn.exists("+termguicolors") then
    vim.o.t_8f = "\x1b[38;2;%lu;%lu;%lum"
    vim.o.t_8b = "\x1b[48;2;%lu;%lu;%lum"
end
set.termguicolors = true
set.cursorline = true
set.hlsearch = true
set.background = 'dark'
vim.cmd[[colorscheme spaceduck]]

-- Encoding
set.encoding = 'utf-8'
set.guifont = 'Lilex Nerd Font:h14'
