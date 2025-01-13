vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.g.background = "light"

-- swapfile
vim.opt.swapfile = false

-- Tabs Indicador
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",      -- Representa tabs como uma seta
  trail = "·",     -- Espaços à direita são mostrados como pontos
  extends = "…",   -- Indicador de texto que ultrapassa a margem direita
  precedes = "…",  -- Indicador de texto antes da margem esquerda
  space = "·",     -- Espaços são mostrados como pontos (opcional)
}

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
