local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><space>', ':Telescope oldfiles<CR><ESC>', { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>T' , builtin.find_files, { desc = "Find Files"})
vim.keymap.set('n', '<leader>fs' , function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
	end)
