return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = "> ",
        selection_caret = "-> ",
        layout_config = { width = 0.9, height = 0.85 },
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
  end,
}
