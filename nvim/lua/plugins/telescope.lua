return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
					find_files = {
						hidden = true,
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob=!**/.git/*",
							"--glob=!**/.idea/*",
							"--glob=!**/.vscode/*",
							"--glob=!**/build/*",
							"--glob=!**/dist/*",
							"--glob=!**/yarn.lock",
							"--glob=!**/package-lock.json",
						},
					},
				},
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-t>", builtin.live_grep, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-b>", builtin.buffers, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tg", builtin.git_status, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { noremap = true, silent = true })
			vim.api.nvim_create_user_command(
				"Rg",
				require("telescope.builtin").live_grep,
				{ desc = "Search project by grep" }
			)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
