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


-----------------------------------
--- Auto Install Mason Packages ---
-----------------------------------

local required_lsps = {
    python = {'python-lsp-server'},
    cpp = {'clangd'},
    lua = {'lua-language-server'}
}
local mason_pkgs_to_install = {}
local mason_registry = require("mason-registry")

local function is_mason_package_installed(pkg_name, registry)
    local pkg

    if registry.has_package(pkg_name) then
        pkg = registry.get_package(pkg_name)
    end

    if pkg:is_installed() then
        return true
    else
        return false
    end
end

-- Get ALE packages to install
for _, linters in pairs(vim.g.ale_linters) do
    for _, linter_name in pairs(linters) do
        if not is_mason_package_installed(linter_name, mason_registry) then
            table.insert(mason_pkgs_to_install, linter_name)
        end
    end
end

-- Get LSPs to install
for _, lang_reqs in pairs(required_lsps) do
    for _, lsp in pairs(lang_reqs) do
        if not is_mason_package_installed(lsp, mason_registry) then
            table.insert(mason_pkgs_to_install, lsp)
        end
    end
end

local next = next
if next(mason_pkgs_to_install) ~= nil then
    for _, pkg_name in ipairs(mason_pkgs_to_install) do
        local pkg = mason_registry.get_package(pkg_name)
        pkg:install()
    end

    require("mason.ui").open()
end
