return {
  'nvim-lualine/lualine.nvim',
  opts = {
    extensions = { 'neo-tree' },
    options = {
      disabled_filetypes = {
        winbar = { 'neo-tree' },
      },
      globalstatus = true,
      theme = 'teide',
    },
    sections = {
      lualine_b = {
        'branch',
      },
      lualine_c = {
        {
          'diagnostics',
          sources = { 'nvim_lsp' },
        },
        {
          function()
            local line = vim.fn.line('.') - 1
            local diagnostics = vim.diagnostic.get(0, { lnum = line })
            if #diagnostics > 0 then
              return diagnostics[1].message
            end
            return ''
          end,
        },
      },
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

