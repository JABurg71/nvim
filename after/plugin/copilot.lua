vim.keymap.set("n", "<leader>Cd", ":Copilot disable<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Ce", ":Copilot enable<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Cp", ":Copilot panel<CR>", { noremap = true, silent = true })

vim.g.copilot_enabled = false
