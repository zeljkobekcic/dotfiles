--vim.api.nvim_buf_set vim.api.nvim_buf_set[[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

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
