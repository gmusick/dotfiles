return {
  'nvim-lualine/lualine.nvim',
  opts = {
    extensions = { 'neo-tree' },
    options = {
      disabled_filetypes = {
        winbar = { 'neo-tree' },
      },
      globalstatus = true,
      theme = 'catppuccin',
    },
    sections = {
      lualine_b = {
        'branch',
        {
          'diagnostics',
          sources = { 'nvim_lsp' },
        },
      },
      lualine_c = {},
      lualine_x = {
        'filetype',
        'lsp_status',
      },
    },
    inactive_winbar = {
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      },
    },
    winbar = {
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      },
    },
  },
}

