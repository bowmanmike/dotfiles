-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.api.nvim_set_keymap("t", "<C-o>", "<C-\\><C-n>", { noremap = true })

vim.cmd([[
  function PrettyPrintJSON()
    :%!jq '.' -M
  endfunction

  function! MinifyJSON()
    :%!jq '.' -cM
  endfunction

  autocmd FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>
  autocmd FileType json nmap <leader>mj :call MinifyJSON()<cr>
]])

vim.cmd([[
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO luafile $MYVIMRC
command! SF luafile %
]])

vim.keymap.set("n", "<leader>cp", ':let @+ = expand("%")<cr>')

-- Map *.erb.yaml files to .yaml
vim.api.nvim_create_autocmd("FileType", {
	pattern = "eruby.yaml",
	command = "set filetype=yaml",
})
