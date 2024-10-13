-- Using catpuccin as the default color scheme
--
-- This configuration sets the flavour (light latte, dark mocha) automatically
-- based on the terminal colors

return {
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
}
