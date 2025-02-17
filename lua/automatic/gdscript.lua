vim.api.nvim_create_autocmd("FileType", {
	pattern = "gdscript",
	callback = function()
		vim.fn.serverstart("/tmp/godot.pipe")
	end
})
