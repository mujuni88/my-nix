-- import mason
local mason = require("mason")

-- import mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

local mason_tool_installer = require("mason-tool-installer")

-- enable mason and configure icons
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "svelte",
    "lua_ls",
    "graphql",
    "emmet_ls",
    "prismals",
    "pyright",
  },
})
-- automatically install ensure_installed servers
mason_lspconfig.setup_handlers({
  -- Will be called for each installed server that doesn't have
  -- a dedicated handler.
  --
  function(server_name) -- default handler (optional)
    -- https://github.com/neovim/nvim-lspconfig/pull/3232
    if server_name == "tsserver" then
      server_name = "ts_ls"
    end
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig")[server_name].setup({

      capabilities = capabilities,
    })
  end,
})

mason_tool_installer.setup({
  ensure_installed = {
    "prettierd", -- prettier formatter
    "prettier",  -- prettier formatter
    "stylua",    -- lua formatter
    "isort",     -- python formatter
    "black",     -- python formatter
    "pylint",
    "eslint_d",
  },
})
