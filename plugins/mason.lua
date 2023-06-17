-- customize mason plugins
return {
  {
    --use mason-lspconfig to configure LSP installations
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "rust_analyzer",
        "tsserver",
        "graphql",
        "dockerls",
        "angularls",
        "html",
        "docker_compose_language_service",
        "lua_ls",
        "tailwindcss",
        "cssls",
        "gopls",
        "elixirls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- ensure_installed = { "rust-analyzer", "stylua" },
      ensure_installed = { "crates", "rustfmt", "stylua", "prettierd", "gofumpt", "revive", "selene" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = { "codelldb" },
    },
  },
}
