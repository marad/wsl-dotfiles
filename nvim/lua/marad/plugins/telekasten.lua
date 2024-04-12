return {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim', 'renerocksai/calendar-vim'},
    config = function ()
        require('telekasten').setup({
            home = vim.fn.expand("~/notes")
        })

        local wk = require('which-key')
        wk.register({
            ["<leader>f"] = "Telekasten",
            ["<leader>fp"] = {"<cmd>Telekasten panel<CR>", "Show panel"},
            ["<leader>ff"] = {"<cmd>Telekasten find_notes<CR>", "Find notes"},
            ["<leader>fs"] = {"<cmd>Telekasten search_notes<CR>", "Search notes"},
            ["<leader>ft"] = {"<cmd>Telekasten show_tags<CR>", "Search tags"},
            ["<leader>fn"] = {"<cmd>Telekasten new_note<CR>", "Create a new note"},
            ["<leader>fo"] = {"<cmd>Telekasten goto_today<CR>", "Open todays daily note"},
            ["<leader>fc"] = {"<cmd>Telekasten show_calendar<CR>", "Show the calendar"},
            ["<leader>fb"] = {"<cmd>Telekasten show_backlinks<CR>", "Show backlinks"},
            ["<leader>fi"] = {"<cmd>Telekasten insert_link<CR>", "Insert link"},
            ["<leader>fg"] = {"<cmd>Telekasten follow_link<CR>", "Follow link"},
        })

        vim.api.nvim_create_autocmd({"BufEnter"}, {
            pattern = {"/home/marad/notes/**.md"},
            callback = function()
                vim.keymap.set("n", "<CR>", "<cmd>Telekasten follow_link<CR>")
                vim.keymap.set("n", "<BS>", "<cmd>b#<CR>")
                vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

                vim.cmd("set conceallevel=2")
                vim.cmd("hi tkLink guifg=Cyan gui=underline")
                vim.cmd("hi tkAliasedLink guifg=Cyan gui=underline")
            end
        })

        --vim.keymap.set("n", "<CR>", "<cmd>Telekasten follow_link<CR>")
        --vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")


        --vim.cmd("set conceallevel=2")
        --vim.cmd("hi tkLink guifg=Cyan gui=underline")
        --vim.cmd("hi tkAliasedLink guifg=Cyan gui=underline")
        --vim.cmd("hi tkBrackets guifg=gray")
    end,
}
