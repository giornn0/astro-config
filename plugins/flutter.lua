return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>D", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
    end
    require("flutter-tools").setup {
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = true,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = true,
        },
      },

      debugger = {           -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
      },
      dev_log = {
        enabled = true,
        open_cmd = "10sp", -- command to use to open the log buffer
      },
      widget_guides = {
        enabled = true,
      },
      lsp = {
        -- on_attach = on_attach,
        color = {
          enabled = true,
        },
        settings = {
          showTodos = true,
          enableSnippets = true,
          enableSdkFormatter = true,
          renameFilesWithClasses = "prompt",
          indentType = "Spaces",
          quoteStyle = "AutoPreferDouble",
          indentWidth = 2,
          collapseSimpleStatement = "Always",
          analysisExcludedFolders = {
            vim.fn.expand "$HOME/.pub-cache",
          },
          updateImportsOnRename = true,
        },
      },
    }
  end,
}
