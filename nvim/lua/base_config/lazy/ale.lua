return
{
    'dense-analysis/ale',
    tag = 'v4.0.0',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_virtualtext_cursor = 'disabled'
        g.ale_warn_about_trailing_whitespace = 0

        g.ale_linters = {
            python = {'pylint', 'flake8', 'mypy'},
            cpp = {'cpplint'}
        }

        -- Linter Specific Configs
        g.ale_python_pylint_options = '--rcfile $HOME/.config/linters/pylint.cfg'
        g.ale_python_flake8_options = '--config $HOME/.config/linters/flake8.cfg'
        g.ale_python_mypy_options = '--config-file $HOME/.config/linters/mypy.cfg'
        g.ale_cpp_cpplint_options = '--extensions=hpp,h,cpp,c --linelength=120 --filter=-runtime/references'
    end
}
