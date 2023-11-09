return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

        local wk = require('which-key')
        wk.register({
            ["<leader>g"] = "Git",
            ["<leader>gs"] = "Status",
        })
    end,
}
