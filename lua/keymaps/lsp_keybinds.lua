-- local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
local nlspsettings = require("nlspsettings")

local lspconfig_defaults = require("lspconfig").util.default_config
-- Lsp_on = false
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		-- if not Lsp_on then
			-- vim.cmd("LspStop")
		-- else
			local opts = { buffer = event.buf }

			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
			vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		-- end
	end,
})

lspconfig.ocamllsp.setup({})
lspconfig.clangd.setup({})
lspconfig.cmake.setup({})
lspconfig.rust_analyzer.setup({
	on_attach = function(client, bufnr)
		-- inlay_hints = { enabled = true }
		vim.lsp.inlay_hint.enable(true)
	end,
})
lspconfig.nim_langserver.setup({})
lspconfig.gopls.setup({})
lspconfig.jdtls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.nil_ls.setup({
	settings = {
		['nil'] = {
			formatting = {
				command = {"alejandra"}
			}
		}
	}
})
lspconfig.denols.setup({
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("package.json"),
	single_file_support = false,
})
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}
lspconfig.pylsp.setup({})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local luasnip = require("luasnip")
local cmp = require("cmp")
-- local cmp_action = require("lsp-zero").cmp_action()
local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path", keyword_length = 3 },
		{ name = "nvim_lsp", keyword_length = 5 },
		{ name = "buffer", keyword_length = 4 },
		{ name = "luasnip", keyword_length = 3 },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "LSP",
				luasnip = "SNIP",
				buffer = "BUF",
				path = "PATH",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-g>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
})
vim.keymap.set({ "i" }, "<C-K>", function()
	luasnip.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	luasnip.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

nlspsettings.setup({
	config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers_fallback = { ".git" },
	append_default_schemas = true,
	loader = "json",
})

function on_attach(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local global_capabilities = vim.lsp.protocol.make_client_capabilities()
global_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	capabilities = global_capabilities,
})

vim.api.nvim_create_user_command("ToggleDiagnostic", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config({
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	})
end, { desc = "toggle diagnostic" })
--[[ vim.api.nvim_create_user_command("ToggleLsp", function()
	if Lsp_on then
		Lsp_on = false
		vim.cmd("LspStop")
	else
		Lsp_on = true
		vim.cmd("LspStart")
	end
end, { desc = "toggle diagnostic" }) ]]

--[[ lspconfig.nixd.setup({
   cmd = { "nixd" },
   settings = {
      nixd = {
         nixpkgs = {
			expr = "import (builtins.getFlake \"/home/ilian/dotfiles/nixos\").inputs.nixpkgs { }"
         },
         formatting = {
			command = {"alejandra"}
         },
         options = {
			nixos = {
				expr = "import (builtins.getFlake \"/home/ilian/dotfiles/nixos\").nixosConfigurations.legionOfNix.options"
			},
			home_manager = {
				expr = "import (builtins.getFlake \"/home/ilian/dotfiles/nixos\").homeConfigurations.\"ilian@legionOfNix\".options"
			}
         },
      },
   },
}) ]]
