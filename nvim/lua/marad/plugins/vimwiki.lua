--return {
--    'vimwiki/vimwiki',
--    lazy = false,
--    init = function()
--        vim.g.vimwiki_folding = 'custom'
--        vim.g.vimwiki_global_ext = 0
--        vim.g.vimwiki_list = {
--            {
--                path = "~/vimwiki",
--                path_html = "~/mywiki",
--                syntax = "markdown",
--                ext = "md",
--                auto_toc = 1,
--                maxhi = 1,
--
--            }
--        }
--    end,
--    config = function()
--        local wk = require('which-key')
--        wk.register({
--            ["<leader>w"] = "VimWiki",
--            ["<leader>wt"] = "Manage tasks",
--            ["<leader>wtt"] = {"<Plug>VimwikiToggleListItem", "Toggle list item"},
--            ["<leader>wtr"] = {"<Plug>VimwikiToggleRejectedListItem", "Toggle rejected item"},
--            ["<leader>ws"] = "Search",
--            ["<leader>wss"] = {"<Plug>VimwikiSearch", "Search the wiki"},
--            ["<leader>wsb"] = {"<Plug>VimwikiBacklinks", "Search backlinks"},
--            ["<leader>w<leader>"] = "Diary",
--            ["<leader>w<leader>p"] ={"<Plug>VimwikiDiaryPrevDay", "Previous day"},
--            ["<leader>w<leader>n"] ={"<Plug>VimwikiDiaryNextDay", "Next day"},
--
--        })
--    end
--
--}
--
return {}