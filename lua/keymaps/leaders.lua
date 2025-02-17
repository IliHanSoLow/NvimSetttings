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
	{ "<leader>bk", "<cmd>Bdelete<cr>", desc = "KillBuf" },
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
	{ "<leader>ft", "<cmd>Telescope filetypes<cr>", desc = "Find File" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope grep" },
	{ "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
	{ "<leader>fc", ":e<space>", desc = "Open new file with name" },
	{ "<leader>fp", "<cmd>Telescope project<cr>", desc = "Find Project" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "<leader>fs", "<cmd>w<cr>", desc = "Save" },
	{ "<leader>g", group = "git" },
	-- { "<leader>gg", "<cmd>Neogit<cr>", desc = "openNeogit" },
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
	{ "<leader>op", "<cmd>Oil<cr>", desc = "Telescope Files" },
	{ "<leader>os", "<cmd>edit /bigssd/Dokumente/ObsidianVault/notes/Scratch.md<cr>", desc = "open scratch" },
	{ "<leader>qq", "<cmd>q<cr>", desc = "Quit" },
	{ "<leader>qo", "<cmd>cw<cr>", desc = "QuckfixOpen" },
	{ "<leader>ql", "<cmd>lua vim.diagnostic.setqflist()<cr>", desc = "Quckfixlsp" },
	{ "<leader>qc", "<cmd>cclose<cr>", desc = "QuickfixClose" },
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
