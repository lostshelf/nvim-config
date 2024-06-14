return {
    "ray-x/starry.nvim",
    init = function()
        require("starry").setup({
            border = false,
            italics = {
                comments = true,
                strings = false,
                keywords = false,
                functions = false,
                variables = true,
            },

            contrast = {
                enable = true,
                terminal = true,
                filetypes = {},
            },

            text_contrast = {
                lighter = false,
                darker = false,
            },

            disable = {
                background = true,
                term_colors = false,
                eob_lines = false,
            },

            style = {
                fix = true,
                deep_black = true,
            }
        })

        vim.g.colorscheme = "starry"
    end
}
