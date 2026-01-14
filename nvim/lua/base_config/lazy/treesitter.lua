return
{
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'master',
    build = ':TSUpdate',
    config = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            ensure_installed = {
                'c',
                'cpp',
                'lua',
                'vim',
                'vimdoc',
                'html',
                'python',
                'markdown',
                'markdown_inline',
                'bash',
                'yaml',
                'xml',
                'dockerfile',
                'git_config',
                'gitignore',
                'nix',
                'perl',
                'toml'
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })

        -- Define highlighting for exta filetypes
        vim.treesitter.language.register('xml', 'launch')
    end
}
