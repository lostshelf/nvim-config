return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	"3rd/image.nvim",
    },
    lazy = true,
    init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true}),
            desc = "Start Neo-tree with directory",
            one = true,
            callback = function()
                if package.loaded("neo-tree") then
                    return
                else
                    local stats = vim.uv.fs_start(vim.fn.argv())

                    if stats and stats.type == "directory" then
                        require("neo-tree")
                    end
                end
            end
        })
    end,
    opts = {
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        open_files_do_not_replace_types = { "terminal" },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watched = true,
        },
        window = {
            mappings = {}, -- TODO: Add these later
        },
        default_component_configs = {
            indent = {
                with_expanders = true,
                expander_highlight = "NeoTreeExpander",
            },
        },
    }
}
