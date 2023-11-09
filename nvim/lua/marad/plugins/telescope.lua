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
        wk.register({
            ["<leader>p"] = "Project",
            ["<leader>pf"] = "Find files",
            ["<leader>ps"] = "Search files",
            ["<leader>t"] = "Telescope",
            ["<leader>tt"] = { "<cmd>Telescope<cr>", "Main telescope UI" },
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
