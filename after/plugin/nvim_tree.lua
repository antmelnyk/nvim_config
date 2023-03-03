-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  diagnostics = {
    enable = true
  },
  view = {
    width = 40,
  },
  filters = {
    dotfiles = false,
  },
})

