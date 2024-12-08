return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

        local wk = require('which-key')
        wk.add({
            { "<leader>g", desc = "Git" },
            { "<leader>gs", desc = "Status"},
        })
    end,
}
