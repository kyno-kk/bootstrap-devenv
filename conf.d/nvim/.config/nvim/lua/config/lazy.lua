local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- いろいろなプラグインが使うらしいので共通で遅延読み込みを先に明示
    { "nvim-lua/plenary.nvim", lazy = true },

    -- 使うかわからん
    -- { "nvim-tree/nvim-web-devicons", lazy = true },
    
    -- 明示的に必要なプラグイン
    { import = "plugins.catppuccin" },
    { import = "plugins.notification" },
  },
})

