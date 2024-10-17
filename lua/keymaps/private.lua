vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.conceallevel = 1

vim.opt.guicursor = "n-v-c:blinkon0,i:blinkon1"

vim.opt.smartcase = true
vim.opt.linebreak = false
vim.opt.wrap = true

vim.cmd("set cursorline | highlight clear CursorLine")
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c6a0f6", bold = true })

--------------------------------------------------

vim.keymap.set("v", "J", ":m'>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m'<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

---------------------------------------
_G.toggle_colorscheme = function()
	-- Check if the current colorscheme is catppuccin-machiato
	if vim.o.termguicolors and vim.o.background == "dark" then
		-- If it is, switch to cyberdream
		vim.cmd("colorscheme cyberdream")
		vim.o.background = "light"
	else
		-- Otherwise, switch to catppuccin-machiato
		vim.cmd.colorscheme("catppuccin-macchiato")
		vim.o.background = "dark"
	end
end
vim.api.nvim_create_user_command("ToggleColorscheme", _G.toggle_colorscheme, {})

vim.keymap.set("n", "<leader>ok", "<cmd>cd /bigssd/Dokumente/ObsidianVault/<CR>")

-- Disable autoformat
vim.g.disable_autoformat = true

-- vim.cmd("set cmdheight=0")

-- Set default shell
--[[ local handle = io.popen("which fish 2>/dev/null")
local result = handle:read("*a")
handle:close()
if result ~= "" then
	vim.o.shell = "fish"
end ]]
