local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp_zero.on_attach(function(_, bufnr)
    -- local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Show hover" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "Go to next diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false , desc = "Go to previous diagnostic" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false , desc = "Rename Variable" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, remap = false })
end)

lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- common on_attach function for all LSPs
local on_attach = function(client, bufnr)
  -- Only format if LSP supports it
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

-- pass this to each LSP setup
require('lspconfig').pyright.setup({
  on_attach = on_attach,
})

