local ls = require("luasnip")

vim.keymap.set("n", "<leader><leader>s", ":source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        -- ['<CR>'] = cmp.mapping.confirm({
        --     select = true,
        --     bhavior = cmp.ConfirmBehavior.Replace,
        -- }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.keymap.set({"i", "s"}, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent=true})


vim.keymap.set({"i", "s"}, "<C-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent=true})

