-- Persistence is a session manager which saves the state of neovim for the
-- current directory.

return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  config = function()
    require("persistence").setup()
    vim.keymap.set("n", "<leader>Ps", require("persistence").load, {})
    vim.keymap.set("n", "<leader>Pl", function() require("persistence").load({ last = true }) end, {})
    vim.keymap.set("n", "<leader>Pd", require("persistence").stop, {})
  end
}
