return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    dependencies = {
        {'echasnovski/mini.icons'},
        {'nvim-tree/nvim-web-devicons'},
    },
    --init = function()
    --    vim.o.timeout = true
    --    vim.o.timeoutlen = 500
    --end,
    opts = {
        plugins = {
            marks = true,
            registers = true,
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            }
        },
        keys = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },
        win = {
            border = "none",
        },
        layout = {
            align = "left"
        }
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        }
    }
}
