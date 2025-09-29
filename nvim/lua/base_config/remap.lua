vim.g.mapleader = " "

-- Remap yank to copy to system clipboard if prefixed with leader
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank selection into system clipboard. Visual mode remap' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank selection into system clipboard' })
vim.keymap.set('n', '<leader>Y', '"+yg_', { desc = 'Select until end of line and yank into system clipboard' })

-- Remap put to paste from system clipboard if prefixed with leader
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from system clipboard after cursor. Visual mode remap' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard after cursor' })
vim.keymap.set('v', '<leader>P', '"+P', { desc = 'Paste from system clipboard before cursor. Visual mode remap' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Paste from system clipboard before cursor' })
