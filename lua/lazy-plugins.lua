require('lazy').setup {

    { 'folke/which-key.nvim',  opts = {} },
    { 'numToStr/Comment.nvim', opts = {} },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {},
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- config = function()
        --     vim.cmd("colorscheme rose-pine")
        -- end
    },

    { 'nvim-telescope/telescope.nvim', version = '*',
        dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'sharkdp/fd' } },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    { 'nvim-treesitter/nvim-treesitter',  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' }, build = ':TSUpdate' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    { 'saadparwaiz1/cmp_luasnip' },
    { -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'catppuccin',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    { 'ThePrimeagen/harpoon' },
    -- { 'jackMort/ChatGPT.nvim',
    --     event = "VeryLazy",
    --     config = function()
    --         require("chatgpt").setup()
    --     end,
    --     dependencies = {
    --         "folke/trouble.nvim"
    --     }
    -- },
}
