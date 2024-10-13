-- Oil is a file manager if you want so which allows files and directories to
-- be managed like a buffer
--
-- In this configuration the trigger for oil is the - (dash, minus) while in
-- normal mode

return {
  'stevearc/oil.nvim',
  config = function()
    require("oil").setup()
    vim.keymap.set("n", "-", function() vim.api.nvim_command("Oil") end, { desc = "Open parent directory" })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
