-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Use relative linenumbers to jump faster around
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Highlight the line with the curso
vim.o.cursorline = true

-- use treesitter for folding
-- configuration taken from https://github.com/nvim-treesitter/nvim-treesitter#folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false

-- Softwrap with word line break
vim.o.wrap = true
vim.o.linebreak = true

-- Set a tab to 4 spaces wide, much easier to read
vim.o.tabstop = 4

-- Set how 'concealed' / differently redered text (like hyperlinks in markdown) are rendered
-- 0 means no change at all
-- For more see :help conceallevel
vim.opt.conceallevel = 0
