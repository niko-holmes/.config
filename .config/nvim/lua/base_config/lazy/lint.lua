return {
    "mfussenegger/nvim-lint",
    dependencies = {
        "williamboman/mason.nvim"
    },

    config = function()
        require("mason").setup()
        require("lint").linters_by_ft = {
            python = {'pylint', 'flake8'},
        }
    end
}
