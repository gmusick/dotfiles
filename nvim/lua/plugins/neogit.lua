return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
  },
  keys = {
    { "<leader>g", "<cmd>Neogit<cr>", desc = "Git" }
  },
  opts = {
    graph_style = "unicode"
  }
}

