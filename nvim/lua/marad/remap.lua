--vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)

-- Move highlithed lines with J/K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center after going up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center after searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nadpisywanie przy wklejeniu bez kopioania tego co nadpisujemy
vim.keymap.set("x", "<leader>p", "\"_dP")

-- przełączanie na systemowy clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

--vim.keymap.set("n", "<C-g>", "<ESC>")

-- Increase/decrease indent with < and > keys
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")


-- Easier window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- Switch to previous file
vim.keymap.set("n", "<c-e>", ":e#<cr>")


local wk = require('which-key')
wk.register({
    ["<leader>pe"] = "Explorer",
    ["<leader>pw"] = "Save current file",
    ["<leader>y"] = "Copy to system clipboard",
    ["<leader>Y"] = "Copy current line to system clipboard",

    -- Navigate buffers
    ["<leader>b"] = "Buffers",
    ["<leader>bj"] = { "<cmd>:bp<cr>", "Switch to previous buffer" },
    ["<leader>bk"] = { "<cmd>:bn<cr>", "Switch to next buffer" },
})

