return {
  "Mofiqul/dracula.nvim",
  priority = 1000,
  config = function()
    local ok, dracula = pcall(require, "dracula")
    if ok then
      dracula.setup({
        transparent_bg = true,
      })
    end
    vim.cmd.colorscheme("dracula")
  end,
}
