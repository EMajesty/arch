local map = vim.keymap.set

map("n", "<leader>pv", ":Ex<CR>", { desc = "Open netrw" })
map({ "n", "x" }, "<leader>m", ":make<CR>", { desc = "Run make" })
map({ "n", "v" }, "<leader>y", "+y", { desc = "Yank to clipboard" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Chmod +x file" })

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics float" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
