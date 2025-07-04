local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon list" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>7", function() ui.nav_file(1) end, { desc = "Harpoon File 1 "})
vim.keymap.set("n", "<leader>8", function() ui.nav_file(2) end, { desc = "Harpoon File 2 "})
vim.keymap.set("n", "<leader>9", function() ui.nav_file(3) end, { desc = "Harpoon File 3 "})
vim.keymap.set("n", "<leader>0", function() ui.nav_file(4) end, { desc = "Harpoon File 4 "})
