local builtin = require("telescope.builtin")
local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

wk.register({
	["<leader>"] = {
		qq = { vim.cmd.q, "Quit" },
		a = { mark.add_file, "Harpoon add File" },
		hh = { "<cmd>Alpha<cr>", "Home" },
		h = {
			name = "+harpoon",
			l = { ui.toggle_quick_menu, "toggle_menu" },
			a = {
				function()
					ui.nav_file(1)
				end,
				"open 1",
			},
			b = {
				function()
					ui.nav_file(2)
				end,
				"open 2",
			},
			c = {
				function()
					ui.nav_file(3)
				end,
				"open 3",
			},
			d = {
				function()
					ui.nav_file(4)
				end,
				"open 4",
			},
		},

		u = { vim.cmd.UndotreeToggle, "UndoTree" },

		f = {
			name = "+file",
			s = { vim.cmd.w, "Save" },
			as = { vim.cmd.wa, "Save All" },
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			n = { "<cmd>enew<cr>", "New File" },
			g = { builtin.git_files, {}, "Open files in Git" },
			p = {
				function()
					builtin.grep_string({ search = vim.fn.input("Grep > ") })
				end,
				"Open file Grep",
			},
			h = { "<cmd>Telescope help_tags<cr>", "Find in Help" },
			m = { "<cmd>Telescope man_pages<cr>", "Find in ManPages" },
		},
		t = {
			name = "+Diagnostics",
			t = { "<cmd>TroubleToggle<cr>", "trouble" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
			l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
			r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
		},
		o = {
			name = "Open",
			o = { vim.cmd.ObsidianQuickSwitch, "Obsidian" },
			d = { vim.cmd.ObsidianToday, "ObsidianToday" },
			s = { "<cmd>edit /bigssd/Dokumente/Obsidian Vault/notes/Scratch.md<cr>", "open scratch" },
			p = { "<cmd>Telescope file_browser<cr>", "Telescope Files" },
			t = { vim.cmd.ToggleTerm, "ToggleTerm" },
		},
		b = {
			name = "+Buffers",
			p = { "<cmd>bprevious<cr>", "PrevBuf" },
			n = { "<cmd>bnext<cr>", "NextBuf" },
			i = { "<cmd>Telescope buffers<cr>", "ListBufs" },
			k = { "<cmd>bd<cr>", "KillBuf" },
		},
		g = {
			name = "+git",
			g = { vim.cmd.Neogit, "openNeogit" },
		},
		r = {
			name = "+reload",
			r = { "<cmd>e!<cr>", "current buffer" },
		},
	},
})
