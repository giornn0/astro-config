-- Mapping data with "desc" stored directly by vim.keymap.set().

-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
--
return {
  -- first key is the mode
  n = {
    --Diagnostics mappings
    -- ["[d"] = { "<cmd> lua vim.diagnostic.goto_next()<cr>" },
    -- ["e"] = { "<cmd> lua vim.diagnostic.open_float()<cr>" },
    -- ["]d"] = { "<cmd> lua vim.diagnostic.goto_prev()<cr>" },
    -- second key is the lefthand side of the map
    ["K"] = {
      function()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ "vim", "help" }, filetype) then
          vim.cmd("h " .. vim.fn.expand "<cword>")
        elseif vim.tbl_contains({ "man" }, filetype) then
          vim.cmd("Man " .. vim.fn.expand "<cword>")
        elseif vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
          require("crates").show_popup()
        else
          vim.lsp.buf.hover()
        end
      end,
    },
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    ["<leader>ml"] = { "<cmd>Lazy load vim-visual-multi<cr>", desc = "Activate multiline" },

    --Tab Navigation
    ["L"] = {
      "<cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>",
      desc = "Tab right",
    },
    ["H"] = {
      "<cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>",
      desc = "Tab left",
    },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --Angular CMDS F
    ["<leader>N"] = { name = "Angular" },
    ["<leader>Ns"] = { ":edit term://ng serve<cr>", desc = "Serve angular project" },
    ["<leader>Nb"] = { ":edit term://yarn run build<cr>", desc = "Build angular project" },
    --Laravel CMDS F
    ["<leader>L"] = { name = "Laravel" },
    ["<leader>Ls"] = { ":edit term://php artisan server<cr>", desc = "Simple serve for laravel project" },
    ["<leader>Ld"] = { ":edit term://php artisan dev<cr>", desc = "Custom dev command" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --Crates Mappings
    ["<leader>T"] = { name = "Crates" },
    ["<leader>Tt"] = { "<cmd>lua require('crates').toggle()<cr>", desc = "Toggle" },
    ["<leader>Tr"] = { "<cmd>lua require('crates').reload()<cr>", desc = "Reload" },
    ["<leader>Tv"] = { "<cmd>lua require('crates').show_versions_popup()<cr>", desc = "Show version popup" },
    ["<leader>Tf"] = { "<cmd>lua require('crates').show_features_popup()<cr>", desc = "Show features popup" },
    ["<leader>Td"] = { "<cmd>lua require('crates').show_dependencies_popup()<cr>", desc = "Show dependencies popup" },
    ["<leader>Tu"] = { "<cmd>lua require('crates').update_crate()<cr>", desc = "Update crate" },
    ["<leader>Ta"] = { "<cmd>lua require('crates').update_all_crates()<cr>", desc = "Update all crates" },
    ["<leader>TU"] = { "<cmd>lua require('crates').upgrade_crate()<cr>", desc = "Upgrade crate" },
    ["<leader>TA"] = { "<cmd>lua require('crates').upgrade_all_crates()<cr>", desc = "Upgrade all crates" },
    ["<leader>TH"] = { "<cmd>lua require('crates').open_homepage()<cr>", desc = "Open homepage" },
    ["<leader>TR"] = { "<cmd>lua require('crates').open_repository()<cr>", desc = "Open repository" },
    ["<leader>TD"] = { "<cmd>lua require('crates').open_documentation()<cr>", desc = "Open documentation" },
    ["<leader>TC"] = { "<cmd>lua require('crates').open_crates_io()<cr>", desc = "Open crates.io" },
    --Flutter Tools mappings
    ["<leader>F"] = { name = "Flutter" },
    ["<leader>Fr"] = { "<cmd>FlutterRun<cr>", desc = "Run Flutter App" },
    ["<leader>Ff"] = {
      "<cmd>lua vim.lsp.buf.format()<cr><cmd>write<cr><cmd>FlutterReanalyze<cr>",
      desc = "Format Flutter App",
    },
    ["<leader>Fd"] = { "<cmd>FlutterDevices<cr>", desc = "Show connected devices" },
    ["<leader>Fo"] = { "<cmd>FlutterOutlineToggle<cr>", desc = "Outline toggle" },
    ["<leader>FO"] = { "<cmd>FlutterOutlineOpen<cr>", desc = "Open Outline window" },
    ["<leader>Fl"] = { "<cmd>FlutterReload<cr>", desc = "Reload the current project" },
    ["<leader>FR"] = { "<cmd>FlutterRestart<cr>", desc = "Restart the current project" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- ["<Esc>"] = { "<C-\\><C-n>", desc = "Exit insert mode terminal" },
  },
  v = {
    ["<leader>T"] = { name = "Crates" },
    ["<leader>Tu"] = { "<cmd>lua require('crates').update_creates()<cr>", desc = "Update crates" },
    ["<leader>TU"] = { "<cmd>lua require('crates').upgrade_crates()<cr>", desc = "Upgrade crates" },
  },
}
