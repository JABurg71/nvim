local set = vim.opt
local key = vim.keymap
local let = vim.g

-- Sets
set.nu = true
set.rnu = true
set.tabstop = 4
set.shiftwidth = 4
set.shiftround = true
set.expandtab = true
set.mouse = a
set.scrolloff = 8
set.hidden = true
set.autoindent = true
set.ignorecase = true
set.swapfile = false
set.errorbells = false
set.incsearch = true
set.hlsearch = false
set.foldenable = false

--Markdown file settings
-- set.textwidth = 0
-- set.wrapmargin = 0
-- set.wrap = true
-- set.linebreak = true
-- set.columns = 80

--Netrw Setting
let.netrw_altv = 1
let.netrw_localrmdir='rm -r'
let.nettw_sizestyle='h'

-- Tools with leader
let.mapleader = ' '
let.maplocalleader = ' '

-- Nvim Lua configs
key.set('n', '<leader>key', ':e ~/.config/nvim/lua/jaburg71/keymaps_&_sets.lua<CR>')
-- key.set('n', '<leader>plug', ':e ~/.config/nvim/lua/jaburg71/plugins.lua<CR>')
key.set('n', '<leader>n', ':e ~/.config/nvim/init.lua<CR>')

--Normal mode
key.set('n', '<leader>w', ':w<CR>')
key.set('n', '<leader>q', ':q<CR>')
key.set('n', '<leader>e', ':E<CR>')
key.set('n', '<leader>m', ':marks<CR>')
key.set('n', '<leader>r', ':reg<CR>')
key.set('n', '<leader>B', ':buffers<CR>')
key.set('n', '<leader>m', ':e ~/Documents/ObsidianLinux/Notes<CR>')

-- key.set('n', 'J', '}')
-- key.set('n', 'K', '{')
-- key.set('n', 'H', '_')
-- key.set('n', 'L', '$')

key.set('v', '<leader>y', '"+y')
key.set('n', '<leader>Y', '"+yg_')
key.set('n', '<leader>y', '"+y')
key.set('v', '<leader>p', '"+p')
key.set('n', '<leader>P', '"+pg_')
key.set('n', '<leader>p', '"+p')

key.set('n', 'gn', ':bn<CR>')
key.set('n', 'gp', ':bp<CR>')

-- key.set('n', '<C-i>', 'O<ESC>')

key.set('n', '<leader>l', ':vertical resize +5<CR>')
key.set('n', '<leader>h', ':vertical resize -5<CR>')
key.set('n', '<leader>k', ':resize +5<CR>')
key.set('n', '<leader>j', ':resize -5<CR>')
key.set('n', '<leader>H', ':resize +30<CR>')

-- Insert Mode
key.set('i', '<C-d>', '<ESC>bC')
-- key.set('i', '<silent><script><expr> <C-j>', 'copilot#Accept("\<CR>")')

-- Markdown Preview
-- key.set('n', '<C-s>', ':MarkdownPreview<CR>')
-- key.set('n', '<M-s>', ':MarkdownPreviewStop<CR>')
-- key.set('n', '<C-p>', ':MarkdownPreviewToggle<CR>')
-- let.markdown_folding = 0
-- let.markdown_syntax_conceal = 0

--Copilot Settings
key.set('n', '<leader>co', ':vertical Copilot panel<CR>')
let.copilot_no_tab_map = true
vim.api.nvim_buf_set_keymap(0, 'i', '<C-j>', 'copilot#Accept("<CR>")', {silent = true, expr = true})
