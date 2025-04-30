return
{
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_warn_about_trailing_whitespaces = 0
        g.ale_fix_on_save = 1

        g.ale_linters = {
            python = {'pycodestyle', 'pylint'},
            lua = {'lua_language_server'}
        }

        g.ale_fixers = {'remove_trailing_lines', 'trim_whitespace'}
    end
}
