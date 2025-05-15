-- Conform is a formatting engine for neovim
--
-- With conform you can basically specify which formatter should be used for
-- which filetype. This helps if the language does not have a coding style
-- (like markdown)

return {
  'stevearc/conform.nvim',
  enabled = true,
  lazy = false,
  event = { 'BufWritePre' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      c = { 'clang-format' },
      markdown = { 'prettier' },
      python = { 'ruff', 'black' }
    },
  },
}
