return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  lazy = false,
  priority = 1000,
  opts = {
    indent = {
      indent = {
        enabled = false,
      },
      animate = {
        enabled = false
      },
      scope = {
        enabled = true,
        hl = "SnacksIndent",
      },
      chunk = {
        enabled = false
      },
    },
    notifier = {},
    picker = {
      layout = "vscode",
      sources = {
        explorer = {
          auto_close = true,
        },
        projects = {
          confirm = function(picker, a, b)
            vim.cmd("tabnew")
            picker:action("tcd")
            -- vim.cmd("LspRestart")
          end,
          dev = { "~/src" },
        },
      }
    },
  },
  keys = {
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification history" },
    { "<leader>p", function() Snacks.picker.projects() end, desc = "Projects" },
  }
}

