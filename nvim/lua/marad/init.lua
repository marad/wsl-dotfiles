vim.g.mapleader = " "

require("marad.lazy")
require("marad.remap")
require("marad.set")

--vim.md [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
