-- render-markdown.nvim renders markdown nicely
--
-- This plugin automatically renders markdownin a nicely
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
