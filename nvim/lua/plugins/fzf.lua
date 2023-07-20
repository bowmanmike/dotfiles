return {
  {
    "junegunn/fzf.vim",
    keys = {
      { "<C-p>", "<cmd>Files<cr>", { silent = true, noremap = true } },
      { "<C-b>", "<cmd>Buffers<cr>", { silent = true, noremap = true } },
      { "<C-t>", "<cmd>Rg<cr>", { silent = true, noremap = true } },
    },
    dependencies = {
      {
        "junegunn/fzf",
      },
    },
  },
}
