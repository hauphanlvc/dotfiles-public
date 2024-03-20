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
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        "docker-compose-language-service",
        "lua-language-server",
        "shellcheck", --
        "cspell",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "markdownlint",
        "pyright",
        "isort",
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "black", -- python formatter
        "eslint_d", -- js linter
        "shfmt",
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
  },
}
