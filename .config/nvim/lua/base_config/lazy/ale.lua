return {
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_virtualtext_cursor = 'disabled'
        g.ale_warn_about_trailing_whitespace = 0

        g.ale_linters = {
            python = {'pylint', 'flake8', 'mypy'}
        }

        -- Linter Specific Configs
        g.ale_python_pylint_options = '--rcfile $HOME/.config/linters/pylint.cfg'
        g.ale_python_flake8_options = '--config $HOME/.config/linters/flake8.cfg'
        g.ale_python_mypy_options = '--config-file $HOME/.config/linters/mypy.cfg'
    end
}
