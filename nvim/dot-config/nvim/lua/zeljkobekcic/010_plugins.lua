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

  -- auto ft detect for ansible
  'mfussenegger/nvim-ansible',

  -- load all other plugins
  { import = 'zeljkobekcic.plugins' },

}, {})
