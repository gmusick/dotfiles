return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        typescript = { "prettier" },
        ["_"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  }
}
