return {
    "neovim/nvim-lspconfig",
    dependencies = {
	{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig"} },
	{ "folke/neodev.nvim", opts = {} },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
    },
}
