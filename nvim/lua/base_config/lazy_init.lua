local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "base_config.lazy",
    change_detection = { notify = false }
})

local function install_mason_package(pkg_name)
    local mason_registry = require("mason-registry")
    local pkg = mason_registry.get_package(pkg_name)
    if not pkg:is_installed() then
        print(string.format("Installing %s", pkg_name))
        pkg:install()
    end
end

-- Install ALE requirements
for _, linters in pairs(vim.g.ale_linters) do
    for _, linter_name in pairs(linters) do
        install_mason_package(linter_name)
    end
end

-- Install LSPs
local required_lsps = {
    python = {'python-lsp-server'},
    cpp = {'clangd'},
    lua = {'lua-language-server'}
}
for _, lang_reqs in pairs(required_lsps) do
    for _, lsp in pairs(lang_reqs) do
        install_mason_package(lsp)
    end
end
