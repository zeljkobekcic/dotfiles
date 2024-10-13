-- Conform is a formatting engine for neovim
--
-- With conform you can basically specify which formatter should be used for
-- which filetype. This helps if the language does not have a coding style
-- (like markdown)

return {
  'stevearc/conform.nvim',
  lazy = false,
  event = { 'BufWritePre' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, oil = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      c = { 'clang-format' },
      markdown = { 'mdformat' },
    },
  },
}
