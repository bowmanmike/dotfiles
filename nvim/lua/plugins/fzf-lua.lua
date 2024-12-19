return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons", { "junegunn/fzf", build = "./install --bin" } },
		config = function(_, opts)
			require("fzf-lua").setup(opts)

			vim.api.nvim_create_user_command("Rg", require("fzf-lua").live_grep, { desc = "Search project by grep" })
		end,
		cmd = "Rg",
		keys = {
			{ "<c-p>", "<cmd>FzfLua files<cr>", { noremap = true, silent = true, desc = "FZF Files" } },
			{ "<c-b>", "<cmd>FzfLua buffers<cr>", { noremap = true, silent = true, desc = "FZF Buffers" } },
			{ "<c-t>", "<cmd>FzfLua live_grep<cr>", { noremap = true, silent = true, desc = "FZF Buffers" } },
			{
				"<leader><leader>",
				"<cmd>FzfLua oldfiles<cr>",
				{ noremap = true, silent = true, desc = "FZF History" },
			},
			{
				"<leader>rr",
				"<cmd>FzfLua lsp_references<cr>",
				{ noremap = true, silent = true, desc = "FZF LSP References" },
			},
			{ "<leader>fh", "<cmd>FzfLua help_tags<cr>", { noremap = true, silent = true, desc = "FZF Help" } },
			-- {
			-- 	"<leader>gt",
			-- 	"<cmd>FzfLua git_status<cr>",
			-- 	{ noremap = true, silent = true, desc = "FZF Git Status" },
			-- },
		},
		opts = {
			oldfiles = {
				include_current_session = true,
				cwd_only = true,
				stat_file = true,
			},
			previewers = {
				builtin = {
					-- don't try to highlight files over 100kb
					syntax_limit_b = 1024 * 100, -- 100KB
				},
			},
			fzf_opts = {
				["--layout"] = "default",
			},
		},
	},
}
