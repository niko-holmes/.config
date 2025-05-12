vim.opt.nu = true                       -- enable line numbers
vim.opt.relativenumber = false	        -- dont use relative line numbers

-- set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.termguicolors = true

vim.opt.updatetime = 1000

vim.diagnostic.config({ virtual_text = true })

-- Set Background to None. This copies the current terminal background and allows transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
