vim.cmd("set number relativenumber")
if vim.g.vscode then
	vim.cmd("set clipboard=unnamedplus")
	vim.cmd("source ~/.config/nvim/vscode/settings.vim")
else
	vim.g.mapleader = " "
	require("plugins")

	require("keymaps")
	vim.cmd("colorscheme kanagawa")
	-- vim.cmd("colorscheme nightfox")
	-- vim.cmd("colorscheme iceberg")
	-- vim.cmd("colorscheme carbonfox")
	-- has to be at the end
	require("plugins.notify")
end
