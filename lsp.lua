-- Extend LSP configuration
return {
  -- enable servers that you already have installed without mason
  servers = {
    "dartls",
  },
  setup_handlers = {
    -- add custom handler
    dartls = function(_, opts) require("flutter-tools").setup { lsp = opts } end,
    rust_analyzer = function(_, opts)
      opts.tools = {
        -- rust-tools options
        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,
        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
          -- default: true
          auto = true,
        },
      }
      opts.settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = true,
          },
          check = {
            command = "clippy",
          },
        },
      }
      opts.dap = {
        adapter = {
          type = "executable",
          command = "codelldb",
          name = "rt_lldb",
        },
      }
      require("rust-tools").setup { server = opts }
    end,
  },
  formatting = {
    -- control auto formatting on save
    format_on_save = {
      enabled = true,     -- enable or disable format on save globally
      allow_filetypes = { -- enable format on save for specified filetypes only
        -- "dart",
      },
      ignore_filetypes = { -- disable format on save for specified filetypes
        -- "python",
      },
    },
    disabled = { -- disable formatting capabilities for the listed language servers
      "dartls",
    },
    timeout_ms = 1000, -- default format timeout
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  config = {
    dartls = {
      -- any changes you want to make to the LSP setup, for example
      color = {
        enabled = true,
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
      },
    },
  },
}
