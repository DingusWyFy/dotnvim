local cmp = require('cmp')
local types = require('cmp.types')
local lspkind = require('lspkind')

local WIDE_HEIGHT = 20

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-l>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    sources = {
        {
            name = 'nvim_lsp_signature_help',
            priority = 100,
            group_index = 1,
        },
        {
            name = 'nvim_lsp',
            priority = 100,
            group_index = 1,
        },
        {
            name = 'nvim_lua',
            priority = 100,
            group_index = 1,
        },
        {
            name = 'luasnip',
            priority = 90,
            group_index = 2,
        },
        {
            name = 'buffer',
            priority = 80,
            autocomplete = false,
            group_index = 3,
        },
        {
            name = 'path',
            priority = 80,
            group_index = 3,
        },
        {
            name = 'spell',
            priority = 50,
            group_index = 3,
        },
        {
            name = 'calc',
            priority = 50,
            group_index = 3,
        },
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    completion = {
        keyword_length = 1,
        completeopt = 'menu,menuone,preview,noinsert',
    },

    confirmation = {
        default_behavior = types.cmp.ConfirmBehavior.Insert,
    },

    preselect = false,

    window = {
        documentation = {
            border = {
                '╭',
                '─',
                '╮',
                '│',
                '╯',
                '─',
                '╰',
                '│',
            },
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
            maxwidth = math.floor(WIDE_HEIGHT * (vim.o.columns / 100)),
            maxheight = math.floor(WIDE_HEIGHT * (vim.o.lines / 100)),
        },
    },

    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
        }),
    },
})

local cmd_maps = cmp.mapping.preset.insert({
    ['<C-e>'] = {
        c = cmp.mapping.select_prev_item(),
    },

    ['<C-n>'] = {
        c = cmp.mapping.select_next_item(),
    },

    ['<C-l>'] = {
        c = cmp.mapping.abort(),
    },
})

-- cmp.setup.cmdline('/', {
    -- sources = {
        -- { name = 'buffer' },
    -- },
    -- mapping = cmd_maps,
-- })

-- cmp.setup.cmdline(':', {
    -- sources = cmp.config.sources({
        -- { name = 'path' },
    -- }, {
        -- { name = 'cmdline' },
    -- }),
    -- mapping = cmd_maps,
-- })
