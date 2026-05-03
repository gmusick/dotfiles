return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require('nvim-treesitter')

    ts.install({ 'python', 'ruby', 'typescript' })

    -- Enable highlighting via autocommand
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'python', 'ruby', 'typescript' },
      callback = function(event)
        vim.treesitter.start(event.buf)
      end,
    })
  end,
}
