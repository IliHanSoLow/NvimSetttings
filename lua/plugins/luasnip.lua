local luasnip = require("luasnip")
luasnip.setup({
	-- Required to automatically include base snippets, like "c" snippets for "cpp"
	load_ft_func = require('luasnip_snippets.common.snip_utils').load_ft_func,
	ft_func = require('luasnip_snippets.common.snip_utils').ft_func,
	-- To enable auto expansin
	enable_autosnippets = true,
	-- Uncomment to enable visual snippets triggered using <c-x>
	-- store_selection_keys = '<c-x>',
})
-- LuaSnip key bindings
vim.keymap.set({"i", "s"}, "<Tab>", function() if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() else vim.api.nvim_input('<C-V><Tab>') end end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() luasnip.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function() if luasnip.choice_active() then luasnip.change_choice(1) end end, {silent = true})
