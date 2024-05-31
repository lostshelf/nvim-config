local opt = vim.opt

opt.number = true
opt.shiftwidth = 4
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.cursorline = true
opt.expandtab = true
opt.list = true
opt.mouse = ""
opt.smartindent = true
opt.termguicolors = true
opt.wrap = false
opt.smoothscroll = true
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = ""

vim.g.markdown_recommended_style = 0

