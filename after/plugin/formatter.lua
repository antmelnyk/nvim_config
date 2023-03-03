require("formatter").setup {
  filetype = {
    rust = {
      function()
        return {
          exe = "rustfmt --edition 2021",
          stdin = true,
        }
      end,
    }
  }
}

vim.keymap.set("n", "<leader>f", function() vim.cmd[[Format]] end)

