return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'simrat39/rust-tools.nvim'},
        -- Autocompletion
        {'L3MON4D3/LuaSnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {
            'hrsh7th/nvim-cmp',
        },

    },
    config = function()
        local lsp = require('lsp-zero')
        local cmp = require('cmp')
        local cmp_action = lsp.cmp_action()

        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({select = false}),

                -- Ctrl+Space to trigger completion menu
                ['<C-e>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                -- Navigate through completions
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }
            }),
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })

        lsp.on_attach(function(_, bufnr)
            local wk = require('which-key')
            wk.register({
                ["gd"] = "Go to definition",
                ["<leader>v"] = "IDE Stuff",
                ["<leader>vw"] = "Workspace",
                ["<leader>vws"] = { function() vim.lsp.buf.workspace_symbol() end, "Symbols", buffer = bufnr, noremap = true },
                ["<leader>vd"] = { function() vim.diagnostic.open_float() end, "Toggle diagnostics", buffer = bufnr, noremap = true },
                ["[d"] = { function() vim.diagnostic.goto_prev() end, "Previous diagnostic", buffer = bufnr, noremap = true },
                ["]d"] = { function() vim.diagnostic.goto_next() end, "Next diagnostic", buffer = bufnr, noremap = true },
                ["<leader>va"] = { function() vim.lsp.buf.code_action() end, "Code Actions", buffer = bufnr, noremap = true },
                ["<leader>vr"] = "Refactor",
                ["<leader>vrr"] = { function() vim.lsp.buf.references() end, "References", buffer = bufnr, noremap = true },
                ["<leader>vrn"] = { function() vim.lsp.buf.rename() end, "Rename", buffer = bufnr, noremap = true },
                ["<C-h>"] = { function() vim.lsp.buf.signature_help() end, "Signature", buffer = bufnr, noremap = true },
            })
        end)

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls", "rust_analyzer", "powershell_es"
            },
            handlers = {
                lsp.default_setup,
            },
        })

        local lua_opts = lsp.nvim_lua_ls()
        require('lspconfig').lua_ls.setup(lua_opts)


        lsp.setup()
    end
}
