vim.opt.nu = true                       -- enable line numbers
vim.opt.relativenumber = false	        -- dont use relative line numbers
vim.opt.updatetime = 1000

-- set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.foldenable = false
vim.diagnostic.config({ virtual_text = true })

vim.opt.termguicolors = true
vim.cmd [[colorscheme space-nvim]]
-- Set Background to None. This copies the current terminal background and allows transparency
-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]]
