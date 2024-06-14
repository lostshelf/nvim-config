return {
    "mrcjkb/rustaceanvim",
    dependencies = {
        "nvim-lspconfig",
        "nvim-cmp",
        "cmp-nvim-lsp"
    },
    version = "^4",
    lazy = false,
    init = function()
        vim.g.rustaceanvim = {
            server = {

            }
        }
    end,
}
