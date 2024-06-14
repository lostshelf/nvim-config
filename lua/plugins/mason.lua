return {
    {
	"williamboman/mason.nvim",
        lazy = false,
        init = function()
            require("mason").setup()
        end,
    },
    {
	"williamboman/mason-lspconfig.nvim",
    }
}
