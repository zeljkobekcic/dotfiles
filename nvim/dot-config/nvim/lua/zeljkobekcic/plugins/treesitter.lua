-- Treesitter for better language parsing
--
-- This file contains two plugins tresitter (base) and treesitter-context
--
-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
-- Treesitter extra modules can be see here
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins

return {
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
        'jsonc',
        'yaml',
        'markdown',
        'gdscript', 'godot_resource', 'gdshader',
        'rust',
        'javascript',
        'c_sharp',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
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
  }
}
