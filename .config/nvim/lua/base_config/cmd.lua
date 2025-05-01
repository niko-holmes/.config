local autocmd = vim.api.nvim_create_autocmd

-- Lint when leaving insert mode
autocmd('InsertLeave', {
    callback = function()
        require("lint").try_lint()
    end,
})

-- Remove trailing whitespaces on buffer save
autocmd('BufWritePre', {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
