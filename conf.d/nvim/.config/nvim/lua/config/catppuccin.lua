-- https://github.com/catppuccin/nvim
require("catppuccin").setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "mocha",
  },
  auto_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  }
})

vim.cmd.colorscheme "catppuccin"
