return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup {
        -- direction = 'vertical',
        direction = 'float',
        insert_mappings = false,
        open_mapping = [[<c-\>]],
        -- size = function(term)
        --   if term.direction == "vertical" then
        --     return vim.o.columns * 0.5
        --   end
        -- end,
        terminal_mappings = true,
      }

      local opts = { noremap = true }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-w>h', [[<C-\><C-n><C-w>h]], opts)
      vim.keymap.set('t', '<C-w>j', [[<C-\><C-n><C-w>j]], opts)
      vim.keymap.set('t', '<C-w>k', [[<C-\><C-n><C-w>k]], opts)
      vim.keymap.set('t', '<C-w>l', [[<C-\><C-n><C-w>l]], opts)
      vim.keymap.set('t', '<C-w>=', [[<C-\><C-n><C-w>=]], opts)

      local Terminal  = require('toggleterm.terminal').Terminal
      local run_ruby = Terminal:new({ hidden = true, direction = 'horizontal' })

      function _run_ruby_toggle()
        run_ruby.dir = vim.fn.getcwd()
        run_ruby.cmd = "ruby " .. vim.fn.expand("%") .. "; read"
        run_ruby.size = 80
        run_ruby:toggle()
      end

      -- vim.keymap.set('n', '<leader>rr', '<cmd>TermExec cmd="ruby %:p"<cr>', opts)
      vim.keymap.set('n', '<leader>rr', '<cmd>lua _run_ruby_toggle()<CR>', opts)
    end,
  }
}

