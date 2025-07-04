-- Telescope is a fuzzy finder that comes with a lot of different things that
-- it can fuzzy find! It's more than just a "file finder", it can search
-- many different aspects of Neovim, your workspace, LSP, and more!
--
-- The easiest way to use Telescope, is to start by doing something like:
--  :Telescope help_tags
--
-- After running this command, a window will open up and you're able to
-- type in the prompt window. You'll see a list of `help_tags` options and
-- a corresponding preview of the help.
--
-- Two important keymaps to use while in Telescope are:
--  - Insert mode: <c-/>
--  - Normal mode: ?
--
-- This opens a window that shows you all of the keymaps for the current
-- Telescope picker. This is really useful to discover what Telescope can
-- do as well as how to actually do it!

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

-- Enable Telescope extensions if they are installed

require('telescope').setup {
-- You can put your default mappings / updates / etc. in here
--  All the info you're looking for is in `:help telescope.setup()`
--
-- defaults = {
--   mappings = {
--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
--   },
-- },
-- pickers = {}
extensions = {
  ['ui-select'] = {
    require('telescope.themes').get_dropdown(),
  },
},
}

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local function telescope_live_grep_open_files()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end


vim.keymap.set('n', '<leader>ff', function()
    builtin.oldfiles({ initial_mode = "normal" })
end, { desc = 'Search Old Files' })
vim.keymap.set('n', '<leader>f/', telescope_live_grep_open_files, { desc = 'Search Open Files' })
vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'Select Search Telescope' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Search Current Word' })
vim.keymap.set('n', '<leader>fl', builtin.lsp_document_symbols, { desc = 'LSP Doc Symbols' })
vim.keymap.set('n', '<leader>fL', builtin.lsp_dynamic_workspace_symbols, { desc = 'LSP dynamic symbols' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Search Keymaps' })
vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>fD', builtin.diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'LSP References' })
vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Go to definition with duplicate filtering" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
-- You can pass additional configuration to Telescope to change the theme, layout, etc.
builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  winblend = 10,
  previewer = false,
})
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>f/', function()
builtin.live_grep {
  grep_open_files = true,
  prompt_title = 'Live Grep in Open Files',
}
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>fn', function()
builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

