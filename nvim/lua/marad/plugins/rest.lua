return {
   "rest-nvim/rest.nvim",
   dependencies = { { "vhyrro/luarocks.nvim" }, { "nvim-neotest/nvim-nio" } },
   ft = "http",
   config = function()
     require("rest-nvim").setup({
       --- Get the same options from Packer setup
       encode_url = true,
    })

    local wk = require('which-key')
    wk.add({
        {"<leader>r", desc = "HTTP Requests"},
        {"<leader>rr", "<Plug>RestNvim", desc = "Run request under cursor"},
        {"<leader>rp", "<Plug>RestNvimPreview", desc = "Preview CURL for request under cursor"},
        {"<leader>rl", "<Plug>RestNvimLast", desc = "Run previos request"},
    })
  end
}
