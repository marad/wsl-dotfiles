return {
   "rest-nvim/rest.nvim",
   dependencies = { { "nvim-lua/plenary.nvim" } },
   config = function()
     require("rest-nvim").setup({
       --- Get the same options from Packer setup
       result_split_horizontal = true,
       result_split_in_place = true,
       encode_url = true,
    })

    local wk = require('which-key')
    wk.register({
        ["<leader>r"] = "HTTP Requests",
        ["<leader>rr"] = {"<Plug>RestNvim", "Run request under cursor"},
        ["<leader>rp"] = {"<Plug>RestNvimPreview", "Preview CURL for request under cursor"},
        ["<leader>rl"] = {"<Plug>RestNvimLast", "Run previos request"},
    })
  end
}
