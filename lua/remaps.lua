vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format File" })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "|", "<C-w>v<C-w>l")

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Netrw" })
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save" })
vim.keymap.set("n", "<leader>W", vim.cmd.wq, { desc = "Save and Quit" })
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", vim.cmd.q, { desc = "Quit without Save" })

vim.keymap.set("n", "<leader>h", ":vertical help ", { desc = "Help(vertical)" })

vim.keymap.set("n", "<Leader>C", "mC:e ~/.config/nvim<CR>", { desc = "Neovim Config Files" })
vim.keymap.set("n", "<Leader>L", "mL:e ~/.local/share/nvim/<CR>", { desc = "Neovim Config Files" })

vim.keymap.set('i', '<C-d>', '<C-W>')

--Folding Setting
vim.keymap.set('n', '<leader>ff', 'zA')
vim.keymap.set('n', '<leader>fr', 'zR')
vim.keymap.set('n', '<leader>fm', 'zM')
