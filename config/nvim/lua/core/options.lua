local opt = vim.opt

opt.clipboard = "unnamedplus"  -- use system clipboard

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.number = true
opt.cursorline = true
opt.ruler = true
opt.mousehide = true
opt.list = false
opt.termguicolors = true

opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignorecase = true

opt.foldmethod = "syntax"
opt.foldlevelstart = 20
opt.foldenable = true

opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.backspace = { "indent", "eol", "start" }
opt.laststatus = 2
opt.autoindent = true
opt.ch = 2
opt.splitbelow = true

vim.cmd "set completeopt-=preview"
