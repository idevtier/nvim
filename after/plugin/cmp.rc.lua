local cmp_status, cmp = pcall(require, "cmp")
if (not cmp_status) then return end

local lspkind_status, lspkind = pcall(require, "lspkind")
if (not lspkind_status) then return end


cmp.setup({
    snippet = {
        expand = function(args)
            local luasnip_status, luasnip = pcall(require, "luasnip")
            if (not luasnip_status) then return end
            require(luasnip).lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({ wirth_text = false, maxwidth = 50 }),
    },
    completion = {
        autocomplete = false,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
