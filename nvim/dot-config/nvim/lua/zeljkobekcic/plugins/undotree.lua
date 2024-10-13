-- Undotree to see nicely all changes in the history of a file
return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    vim.g.undotree_WindowLayout = 3
  end
}
