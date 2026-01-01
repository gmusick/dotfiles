return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    -- { "<leader>e", "<cmd>Neotree reveal dir=" .. vim.fn.getcwd(1, vim.fn.tabpagenr()) .. "<cr>",  desc = "File tree" },
    { "<leader>e", "<cmd>Neotree reveal<cr>",  desc = "File tree" },
  },
  opts = {
    -- fill any relevant options here
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          -- auto close
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true
      },
      -- hijack_netrw_behavior = "open_current"
    }
  },
}

