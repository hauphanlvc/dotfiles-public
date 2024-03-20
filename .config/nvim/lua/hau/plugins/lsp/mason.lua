return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            pip = {
                upgrade_pip = true,
            },
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            local packages = {
                "bash-language-server",
                "black",
                "clang-format",
                "clangd",
                "codelldb",
                "cspell",
                "css-lsp",
                "eslint-lsp",
                "html-lsp",
                "json-lsp",
                "lua-language-server",
                "markdownlint",
                "prettier",
                "pyright",
                "shfmt",
                "tailwindcss-language-server",
                "typescript-language-server",
                "yaml-language-server",
                "gopls",
                "editorconfig-checker",
                "docker-compose-language-service",
                "shellcheck",
            }
            local function ensure_installed()
                for _, package in ipairs(packages) do
                    local p = mr.get_package(package)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    }, }
