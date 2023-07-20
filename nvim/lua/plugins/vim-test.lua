return {
  "vim-test/vim-test",
  config = function()
    vim.cmd([[ let test#strategy="neovim"]])
  end,
  keys = {
    { "<leader>tn", ":TestNearest<cr>", desc = "[T]est [N]earest" },
    { "<leader>tf", ":TestFile<cr>", desc = "[T]est [F]ile" },
    { "<leader>tl", ":TestLast<cr>", desc = "[T]est [L]ast" },
  },
}
