vim.g.mapleader = " "

require("marad.lazy")
require("marad.remap")
require("marad.set")
require("marad.notes").setup()

vim.cmd("set conceallevel=2")

--vim.md [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
