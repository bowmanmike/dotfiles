return {
  "vim-test/vim-test",
  config = function()
    vim.cmd([[ let test#strategy="neovim"]])
    vim.keymap.set("n", "<leader>tn", ":TestNearest<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>tf", ":TestFile<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>tl", ":TestLast<cr>", { noremap = true, silent = true })
  end,
}
