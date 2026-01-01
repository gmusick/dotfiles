return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    winopts = {
      -- fullscreen = true,
      height = 20,
      preview = {
        hidden = true,
        layout = "vertical",
        wrap = true
      }
    },
    files = {
      cwd_prompt = false,
      -- path_shorten = 4,
      -- previewer = false,
    },
    buffers = {
      cwd_only = true,
    },
    keymap = {
      builtin = {
        ["<C-S-w>"] = "toggle-preview-wrap",
        -- ["<C-S-p>"] = "toggle-preview",
      },
      fzf = {
        ["ctrl-q"] = "select-all+accept"
      }
    }
  },
  keys = {
    { "<leader>f", function() FzfLua.files() end, desc = "Files" },
    { "<leader><leader>f", function() FzfLua.files({ resume = true }) end, desc = "Resume files" },
    { "<leader>b", function() FzfLua.buffers() end, desc = "Buffers" },
    { "<leader>/", function() FzfLua.live_grep({ winopts = { height = 0.85 }}) end, desc = "Live grep" },
    { "<leader><leader>/", function() FzfLua.live_grep({ resume = true, winopts = { height = 0.85 }}) end, desc = "Resume live grep" },
    { "<leader>*", function() FzfLua.grep_cword({ winopts = { height = 0.85 }}) end, desc = "Grep word under cursor" },
    { "<leader><space>", function() FzfLua.resume() end, desc = "Resume" },
    { "<leader>h", function() FzfLua.git_bcommits({ winopts = { fullscreen = true, preview = { hidden = false }}}) end, desc = "History" },
  }
}

