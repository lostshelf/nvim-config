return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    opts = function()
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()

        return {
            completion = {
                completeopt = "menu,menuone,noinsert"
            }
        }
    end
}
