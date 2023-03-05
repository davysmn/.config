vim.g.mapleader = " "
vim.keymap.set("n", "<leader>px", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pt", ":NvimTreeFocus<enter>")
vim.keymap.set("n", "ƒ", ":m+<enter>")
vim.keymap.set("n", "∫", ":m-2<enter>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
