-- Bootstrap lazy.nvim
-- https://github.com/folke/lazy.nvim
-- :help lazy.nvim.txt
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',                opts = {} },

  -- Add indentation guides even on blank lines
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',               opts = {} },

  -- practical mode for focused writing
  -- { "folke/zen-mode.nvim",                 opts = {} },

  -- QMK/ZMK plugin
  'codethread/qmk.nvim',

  -- auto creates closing bracket and such
  { 'windwp/nvim-autopairs',        event = "InsertEnter", opts = {} },

  -- load all other plugins
  { import = 'zeljkobekcic.plugins' },

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        background = {
          light = "latte",
          dark = "mocha",
        },
        term_colors = true,
        integrations = {
          neotree = true
        }
      })
      require("catppuccin").load()
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- file manager
  {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", function() vim.api.nvim_command("Oil") end, { desc = "Open parent directory" })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Restore previous session for this working directory
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup()
      vim.keymap.set("n", "<leader>Ps", require("persistence").load, {})
      vim.keymap.set("n", "<leader>Pl", function() require("persistence").load({ last = true }) end, {})
      vim.keymap.set("n", "<leader>Pd", require("persistence").stop, {})
    end
  },

  -- Treesitter for better language parsing
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'c', 'cpp',
        'go',
        'lua',
        'python',
        'vimdoc', 'vim',
        'bash',
        'go',
        'hcl', 'terraform',
        'dockerfile',
        'devicetree',
        'json',
        'yaml',
        'markdown',
        'gdscript', 'godot_resource', 'gdshader'
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
      -- Treesitter extra modules can be see here
      -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
    end,
  },

  -- Treesitter Context, so see where I am in the code
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      separator = nil,
      zindex = 20,
      on_attach = nil
    }
  },

  -- Undotree to see nicely all changes in the history of a file
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
      vim.g.undotree_WindowLayout = 3
    end
  },

  -- Surround manipulation
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {}
  },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
      end,
    },
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = { { "filename", path = 1 } }
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1 } }
      },
    }
  }

}, {})



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



--vim.api.nvim_buf_set vim.api.nvim_buf_set[[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local function insertFullPath()
  local filepath = vim.fn.expand('%:p')
  vim.fn.setreg('+', filepath) -- write to clippoard
  print('Yanked full path ' .. filepath)
end

local function insertRelativePath()
  local filepath = vim.fn.expand('%:~:.')
  vim.fn.setreg('+', filepath) -- write to clippoard
  print('Yanked relative path ' .. filepath)
end

vim.keymap.set('n', '<leader>ypf', insertFullPath,
  { desc = 'Copy full path to file to clipboard', noremap = true, silent = true })

vim.keymap.set('n', '<leader>ypr', insertRelativePath,
  { desc = 'Copy relative path to file to clipboard', noremap = true, silent = true })



-- tnoremap <Esc> <C-\><C-n>
-- tnoremap <M-[> <Esc>
-- tnoremap <C-v><Esc> <Esc>
-- vim.keymap.set("t", '<Esc>', '<C-\\><C-n>')
