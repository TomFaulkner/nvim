-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local ok, err = pcall(vim.fn.system, {
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  if not ok then
    vim.notify("Failed to install lazy.nvim: " .. err, vim.log.levels.ERROR)
    return
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load settings
require("tom.set")

-- Plugin setup
require("lazy").setup({
  { import = "tom.plugins" },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
}, {
  checker = { enabled = true },
})
