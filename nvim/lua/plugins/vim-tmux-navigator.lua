return {
	"christoomey/vim-tmux-navigator",
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
		vim.g.tmux_navigator_save_on_switch = 2
	end,
	config = function()
		-- vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
		-- vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
		-- vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
		-- vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
	end,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		-- "TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true } },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true } },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true } },
		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true } },
		-- 	-- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
