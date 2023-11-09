return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
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
        motions = {
            count = true
        },
        popup_mappings = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },
        window = {
            border = "none",
            winblend = 20,
        },
        layout = {
            align = "left"
        }
    }
}
