return {
    "hrsh7th/nvim-cmp",
    version = false,
    lazy = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/luasnip",
        "petertriho/cmp-git"
    },
    opts = function()
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()

        return {
            completion = {
                completeopt = "menu,menuone,noinsert"
            }
        }
    end,
    init = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_org_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback) 
                    if cmp.visible() then
                        cmp.select_prev_itm()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {  "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvm_lsp" },
                { name = "luasnip" }
            }, {
                { name = "buffer" }
            })
        })

        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = "git" },
            }, {
                { name = "buffer" }
            })
        })

        require("cmp_git").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities
        })

    end,

}
