vim.g.mapleader = " "
vim.keymap.set("n", "<leader>px", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pt", ":NvimTreeToggle<enter>")
vim.keymap.set("n", "<leader>pr", ":NvimTreeRefresh<enter>")
vim.keymap.set({"n"}, "∫", ":m+<enter>")
vim.keymap.set({"n"}, "ƒ", ":m-2<enter>"
)
vim.keymap.set("n", "<leader>L", function()
    vim.cmd("LazyGit")
end)
