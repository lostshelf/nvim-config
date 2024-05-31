return {
    {
	"williamboman/mason.nvim",
	init = function()
	    require("mason").setup()
	end
    },
    {
	"williamboman/mason-lspconfig.nvim",
    }
}
