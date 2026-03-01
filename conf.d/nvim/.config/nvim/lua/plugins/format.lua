return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd" }, -- "prettier" の代わりに "prettierd" を指定
      typescript = { "prettierd" },
    },
  },
}
