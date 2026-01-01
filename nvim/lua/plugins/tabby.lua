return {
  'nanozuki/tabby.nvim',
  opts = {
    preset = 'tab_only',
    option = {
      tab_name = {
        name_fallback = function(tabid)
          local tab_number = vim.api.nvim_tabpage_get_number(tabid)
          return vim.fn.fnamemodify(vim.fn.getcwd(1, tab_number), ':t')
        end,
      },
    }
  }
}

