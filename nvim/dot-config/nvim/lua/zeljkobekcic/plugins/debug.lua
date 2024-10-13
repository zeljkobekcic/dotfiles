-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

local function keymaps()
  return {
    { "<leader>db", function() require('dap').toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
    { "<leader>dB", function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>di", function() require('dap').step_into() end,                                            desc = "Step Into" },
    { "<leader>dj", function() require('dap').down() end,                                                 desc = "Down" },
    { "<leader>dk", function() require('dap').up() end,                                                   desc = "Up" },
    { "<leader>dl", function() require('dap').run_last() end,                                             desc = "Run Last" },
    { "<leader>do", function() require('dap').step_out() end,                                             desc = "Step Out" },
    { "<leader>dO", function() require('dap').step_over() end,                                            desc = "Step Over" },
    { "<leader>dp", function() require('dap').pause() end,                                                desc = "Pause" },
    { "<leader>dr", function() require('dap').repl.toggle() end,                                          desc = "Toggle REPL" },
    { "<leader>ds", function() require('dap').session() end,                                              desc = "Session" },
    { "<leader>dt", function() require('dap').terminate() end,                                            desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
  }
end

return {

  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Dependency for dap
    { "nvim-neotest/nvim-nio" },

    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }



    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {}

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()
    require('dap-python').setup('~/.local/share/nvim/venv/bin/python')
  end,

  keys = keymaps()
}
