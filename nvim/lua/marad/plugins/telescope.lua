return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function(_, opts)
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("grep >") })
        end)

        local wk = require('which-key')
        wk.add({
            {"<leader>p", group = "Project"},
            {"<leader>pf", group = "Find files"},
            {"<leader>ps", group = "Search files"},
            {"<leader>t", group = "Telescope"},
            {"<leader>tt", "<cmd>Telescope<cr>", desc = "Main telescope UI" },
            {"<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Switch buffers"},
        })

        opts.defaults = {
            mappings = {
                i = {
                    ["<Esc>"] = "close",
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                }
            }
        }
    end,
}
