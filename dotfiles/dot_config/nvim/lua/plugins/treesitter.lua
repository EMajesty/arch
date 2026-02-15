return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "json",
        "lua",
        "markdown",
        "nix",
        "python",
        "rust",
        "toml",
        "typescript",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
