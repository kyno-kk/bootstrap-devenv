-- https://github.com/catppuccin/nvim
require("catppuccin").setup({
  custom_highlights = function(colors)
    return {
      -- 相対行番号の視認性を上げる
      LineNr = { fg = colors.subtext0 }, 
      -- 相対行番号を明るくしたので、現在行番号の色を強調する
      CursorLineNr = { fg = colors.lavender, style = { "bold" } },
    }
  end
})

vim.cmd.colorscheme "catppuccin"
