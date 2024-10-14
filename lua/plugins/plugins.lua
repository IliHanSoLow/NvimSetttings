require("lazy").setup({
	"folke/lazy.nvim",
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						-- theme = "ivy",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						no_ignore = true,
					},

					-- Config for projects
					project = {
						base_dirs = {
							"/bigssd/Dokumente/git/",
						}
					}
				},

			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("project")
		end,
	},
	{ "nvim-telescope/telescope-ui-select.nvim", lazy = true },
	{ "nvim-telescope/telescope-project.nvim", lazy = true },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		lazy = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "User FileOpened",
		opts = {}
		-- cmd = "Gitsigns",
		-- lazy = true,
	},
	{
		"numToStr/Comment.nvim",
		keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
		event = "User FileOpened",
		lazy = true,
	},
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
		event = "VeryLazy",
		lazy = true,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"SmiteshP/nvim-navic",
		event = "User FileOpened",
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Terminal
	--[[ {
		"akinsho/toggleterm.nvim",
		branch = "main",
		cmd = {
			"ToggleTerm",
			"TermExec",
			"ToggleTermToggleAll",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualLines",
			"ToggleTermSendVisualSelection",
		},
	}, ]]
	{
		"RRethy/vim-illuminate",
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = "User FileOpened",
	-- 	main = "ibl",
	-- 	---@module "ibl"
	-- 	---@type ibl.config
	-- 	opts = {},
	-- },
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				theme = "wave", -- Load "wave" theme when 'background' option is not set
			})
		end,
	},
	--[[ {
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({ -- Optional, you don't have to run setup.
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLine",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
				extra_groups = {
					"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
					"NvimTreeNormal", -- NvimTree
				},
				exclude_groups = {}, -- table: groups you don't want to clear
			})
		end,
	}, ]]
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"EdenEast/nightfox.nvim",
	"oahlen/iceberg.nvim",
	"nvim-treesitter/playground",
	{"ThePrimeagen/harpoon", lazy = true},
	"mbbill/undotree",
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		lazy = true,
	},
	"easymotion/vim-easymotion",
	{"ThePrimeagen/vim-be-good", cmd = "VimBeGood", lazy = true},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	--- Uncomment the two plugins below if you want to manage the language servers from neovim
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>tT",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		lazy = true,
	},
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = true,
	},
	--[[ {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	}, ]]
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		-- ft = "markdown",
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		event = {
			"BufReadPre /bigssd/Dokumente/ObsidianVault/**.md",
			"BufNewFile /bigssd/Dokumente/ObsidianVault/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "/bigssd/Dokumente/ObsidianVault",
					overrides = {
						notes_subdir = "notes",
					},
				},
			},
			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "notes/dailies",
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = "%Y-%m-%d",
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = "%B %-d, %Y",
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = nil,
			},
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
			},
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				vim.fn.jobstart({ "xdg-open", url }) -- linux
			end,
		},
		-- Optional, customize how names/IDs for new notes are created.
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		image_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("%s-", os.time())
		end,
		cmd = { "Obsidian", "ObsidianToday", "ObsidianQuickSwitch" },
	},
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	{
		"epwalsh/pomo.nvim",
		version = "*", -- Recommended, use latest release instead of latest commit
		lazy = true,
		cmd = { "TimerStart", "TimerRepeat" },
		dependencies = {
			-- Optional, but highly recommended if you want to use the "Default" timer
			"rcarriga/nvim-notify",
		},
		opts = {},
	},
	"habamax/vim-godot",
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy = true,
	},
	"tpope/vim-sleuth",
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{ "tamago324/nlsp-settings.nvim" },
	{ "uga-rosa/ccc.nvim", lazy = true },
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Recommended - see "Configuring" below for more config options
				transparent = false,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = false,
				theme = {
					variant = "light",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	-- "andweeb/presence.nvim",
	"blazkowolf/gruber-darker.nvim",
	{
		'echasnovski/mini.nvim', version = false,
		config = function()
			require("mini.basics").setup({})
			require("mini.ai").setup({})
			require("mini.jump").setup({})
			require("mini.surround").setup({
				mappings = {
					add = '<leader>sa',
					delete = '<leader>sd',
					find = '<leader>sf',
					find_left = '<leader>sF',
					highlight = '<leader>sh',
					replace = '<leader>sr',
					update_n_lines = '<leader>sn',
					suffix_last = 'l',
					suffix_next = 'n',
				}
			})
			require("mini.move").setup({mappings = {
				left = '<C-h>',
				right = '<C-l>',
				down = '<C-j>',
				up = '<C-k>',
			}})
		end,
	},
	"rhysd/vim-llvm",
	-- "LudoPinelli/comment-box.nvim",
	"Airbus5717/c3.vim",
	{
		'mireq/luasnip-snippets',
		dependencies = {'L3MON4D3/LuaSnip'},
		init = function()
			-- Mandatory setup function
			require('luasnip_snippets.common.snip_utils').setup()
		end

	},
	--[[ {
		"sakhnik/nvim-gdb",
		lazy = true,
		cmd = {"GdbStart", "GdbStartLLDB"}
	} ]]
	require("plugins.dab")
})
