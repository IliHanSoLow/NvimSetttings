vim.cmd("set number relativenumber")
if vim.g.vscode then
	local is_windows = string.find(vim.loop.os_uname().version, "Windows") ~= nil
	if (is_windows) then
		vim.cmd("source ~\\AppData\\Local\\nvim\\vscode\\settings.vim")
		vim.cmd("set clipboard=unnamedplus")
	else
		vim.cmd("source ~/.config/nvim/vscode/settings.vim")
	end
	
else
	if vim.g.neovide then
		require("neovide")
	end
	vim.g.mapleader = " "
	require("plugins")

	if os.getenv("COLOR_THEME") == "light" then
		vim.cmd("colorscheme cyberdream")
		vim.o.background = "light"
	else
		-- vim.cmd.colorscheme("catppuccin-macchiato")
		vim.cmd("colorscheme kanagawa")
		vim.o.background = "dark"
	end
	-- vim.cmd.colorscheme("cyberdream-light")
	-- vim.cmd("colorscheme nightfox")
	-- vim.cmd("colorscheme iceberg")
	-- vim.cmd("colorscheme carbonfox")
	-- vim.cmd.colorscheme("gruber-darker")
	-- has to be at the end

	require("keymaps")
	require("plugins.notify")
end
