return {
  "nvim-treesitter/nvim-treesitter",
  configs = {
    autotag = {
      enable = true,
    },
    filetypes = {
      "html",
      "blade.php",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
    },
  },
  opts = {
    ensure_installed = { "html", "tsx", "php" },
  },
}
