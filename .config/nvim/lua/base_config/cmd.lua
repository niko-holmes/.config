local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespaces on buffer save
autocmd('BufWritePre', {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
