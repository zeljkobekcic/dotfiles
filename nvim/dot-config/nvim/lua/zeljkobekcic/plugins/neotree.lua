return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup(
      {
        window = {
          position = "right",
          width = 60,
        },

        filesystem = {
          hijack_netrw_behavior = "disabled",
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          }
        }
      }
    )
    vim.keymap.set('n', '<leader>t', function()
      vim.api.nvim_command("Neotree source=filesystem toggle=true")
    end, { desc = "Toggle NeoTree" }
    )
  end
}
