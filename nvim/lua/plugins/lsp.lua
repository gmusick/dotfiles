return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("ruby_lsp")
      -- require("lspconfig").ruby_lsp.setup {}
    end
  }
}

