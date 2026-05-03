require("config.lazy")

-- default indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- show line numbers
vim.opt.number = true

-- new splits are created below / right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- don't wrap lines
vim.opt.wrap = false

-- keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- mouse mode
vim.opt.mouse = 'a'

-- go to tab to the left when closing a tab (default is to go to right)
vim.opt.tabclose = 'left'

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- don't put deleted chars into clipboard
vim.keymap.set({"n", "v"}, "x", '"_x')
vim.keymap.set({"n", "v"}, "X", '"_X')

-- highlight cursor
vim.opt.cursorline = true

-- always show tabline
vim.o.showtabline = 2

function _G.CopyBufferName()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', '"' .. filepath .. '"')
end

-- copy relative path of current buffer
vim.keymap.set('n', '<leader>cp', CopyBufferName, { noremap = true, silent = true })

-- resize splits when window size changes
vim.api.nvim_create_autocmd({ "VimResized" }, {
  pattern = "*",
  callback = function()
    vim.cmd("wincmd =")
  end
})

-- turn on line wrapping for markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- clear search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlighting' })

-- format file
vim.keymap.set(
  'n',
  '<leader>=',
  function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd("normal! ggVG=")
    vim.fn.setpos(".", save_cursor)
  end,
  { desc = 'Format file' }
)

-- Need to maintain cursor and scroll position for this to work
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = "*",
--   callback = function()
--     local save_cursor = vim.fn.getpos(".")
--     vim.cmd("normal! ggVG=")
--     vim.fn.setpos(".", save_cursor)
--   end
-- })

-- buffer navigation
vim.keymap.set('n', '<leader>[', '<cmd>bp<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>]', '<cmd>bn<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<Tab>', '<cmd>bn<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<BS>', '<cmd>bp<cr>', { desc = 'Previous buffer' })

-- tab management
vim.keymap.set('n', '<C-x>', '<cmd>tabclose<cr>', { desc = 'Close tab' })
-- vim.keymap.set('n', '<leader>[', 'gT', { desc = 'Previous tab' })
-- vim.keymap.set('n', '<leader>]', 'gt', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>1', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>2', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>3', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<leader>4', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<leader>5', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<leader>6', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<leader>7', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<leader>8', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<leader>9', '9gt', { desc = 'Go to tab 9' })

-- quickfix commands
vim.keymap.set('n', '<leader>q', '<cmd>cclose<CR>', { desc = 'Close quickfix window' })

-- lsp setup
vim.lsp.config('ty', {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  settings = {},
})
vim.lsp.enable('ty')

vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  settings = {}
})
vim.lsp.enable('ruff')

vim.lsp.config('vtsls', {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  init_options = { hostInfo = "neovim" }
})
vim.lsp.enable('vtsls')

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Show diagnostic pop-up' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Show diagnostics in qflist' })
vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show diagnostics in qflist' })
-- lsp go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.opt.guifont = "Monaspace Neon NF:h16"

vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00

vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end)
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.1)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1/1.1)
end)

-- CMD-C to copy (yank) to system clipboard
vim.keymap.set({'n', 'v'}, '<D-c>', '"+y', { noremap = true })

-- CMD-V to paste from system clipboard
vim.keymap.set({'n', 'v', 'i'}, '<D-v>', '<C-r>+', { noremap = true })

-- gui tab management
vim.keymap.set('n', '<D-w>', '<cmd>tabclose<cr>', { noremap = true })
vim.keymap.set('n', '<D-1>', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<D-2>', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<D-3>', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<D-4>', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<D-5>', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<D-6>', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<D-7>', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<D-8>', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<D-9>', '9gt', { desc = 'Go to tab 9' })
