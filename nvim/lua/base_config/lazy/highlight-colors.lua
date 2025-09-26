return
{
    'brenoprata10/nvim-highlight-colors',

    config = function()
        local colors = require('nvim-highlight-colors')

        colors.setup({
            render = 'background',
            enable_hex = true,
            enable_short_hex = false,
            enable_rgb = true,
            enable_hsl = true,
            enable_ansi = true,
            enable_hsl_without_function = false,
            enable_var_usage = false,
            enable_named_colors = false,
            enable_tailwind = false
        })
        colors.turnOn()
    end
}
