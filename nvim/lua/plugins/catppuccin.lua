return {
  "catppuccin/nvim",
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      no_italic = true,
      show_end_of_buffer = true,
      term_colors = true,
    })

    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
  name = "catppuccin",
  priority = 1000
}

