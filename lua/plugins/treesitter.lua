return {
    "nvim-treesitter/nvim-treesitter",
    init = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
            },
        })
    end,
    lazy = false
}
