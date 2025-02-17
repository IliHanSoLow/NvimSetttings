require("keymaps.leaders")
require("keymaps.private")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Space>w", "<C-w>", { noremap = true })
