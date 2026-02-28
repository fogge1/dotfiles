return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",       -- utility functions many plugins rely on
      "nvim-tree/nvim-web-devicons", -- file icons
      "MunifTanjim/nui.nvim",        -- UI components
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true,      -- highlight the file you're editing in the tree
          },
          hide_dotfiles = false, -- show dotfiles like .zshrc, .gitignore
        },
        window = {
          width = 30,
        },
      })

      -- Toggle with <Space>fe
      vim.keymap.set("n", "<leader>fe", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
    end,
  },
}
