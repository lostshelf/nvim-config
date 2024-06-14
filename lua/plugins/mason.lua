return {
    {
	"williamboman/mason.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        init = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
        end,
    },
}
