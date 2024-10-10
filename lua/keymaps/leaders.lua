local builtin = require("telescope.builtin")
local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

wk.add({
	{
		"<leader>a",
		function()
			mark.add_file()
		end,
		desc = "Harpoon add File",
	},
	{ "<leader>b", group = "Buffers" },
	{ "<leader>bi", "<cmd>Telescope buffers<cr>", desc = "ListBufs" },
	{ "<leader>bk", "<cmd>bd<cr>", desc = "KillBuf" },
	{ "<leader>bn", "<cmd>bnext<cr>", desc = "NextBuf" },
	{ "<leader>bp", "<cmd>bprevious<cr>", desc = "PrevBuf" },
	{ "<leader>f", group = "file" },
	{
		"<leader>fas",
		function()
			vim.cmd.wa()
		end,
		desc = "Save All",
	},
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find in Help" },
	{ "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Find in ManPages" },
	{ "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
	{ "<leader>fc", ":e<space>", desc = "Open new file with name" },
	{
		"<leader>fg",
		function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end,
	},
	{
		"<leader>fp",
		function()
			require'telescope'.extensions.project.project{}
		end,
	},
		desc = "Open file Grep",
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "<leader>fs", "<cmd>w<cr>", desc = "Save" },
	{ "<leader>g", group = "git" },
	{ "<leader>gg", "<cmd>Neogit<cr>", desc = "openNeogit" },
	{ "<leader>h", group = "harpoon" },
	{
		"<leader>ha",
		function()
			ui.nav_file(1)
		end,
		desc = "open 1",
	},
	{
		"<leader>hb",
		function()
			ui.nav_file(2)
		end,
		desc = "open 2",
	},
	{
		"<leader>hc",
		function()
			ui.nav_file(3)
		end,
		desc = "open 3",
	},
	{
		"<leader>hd",
		function()
			ui.nav_file(4)
		end,
		desc = "open 4",
	},
	{ "<leader>hh", "<cmd>Alpha<cr>", desc = "Home" },
	{
		"<leader>hl",
		function()
			ui.toggle_quick_menu()
		end,
		desc = "toggle_menu",
	},
	{ "<leader>o", group = "Open" },
	{
		"<leader>od",
		function()
			vim.cmd.ObsidianToday()
		end,
		desc = "ObsidianToday",
	},
	{
		"<leader>oo",
		function()
			vim.cmd.ObsidianQuickSwitch()
		end,
		desc = "Obsidian",
	},
	{ "<leader>op", "<cmd>Telescope file_browser<cr>", desc = "Telescope Files" },
	{ "<leader>os", "<cmd>edit /bigssd/Dokumente/ObsidianVault/notes/Scratch.md<cr>", desc = "open scratch" },
	{ "<leader>qq", "<cmd>q<cr>", desc = "Quit" },
	{ "<leader>r", group = "reload" },
	{ "<leader>rr", "<cmd>e!<cr>", desc = "current buffer" },
	{
		"<leader>u",
		function()
			vim.cmd.UndotreeToggle()
		end,
		desc = "UndoTree",
	},
}
)
