require("plugins.lazy")
require("plugins.plugins")
require("plugins.comments")
require("plugins.treesitter")
require("plugins.treesitter-textobjects")
require("plugins.conform")
require("plugins.toggleterm")
require("plugins.alpha")
require("plugins.colorizer")
require("plugins.luasnip")
vim.cmd('set rtp^="\'"$(opam config var ocp-indent:share)')
