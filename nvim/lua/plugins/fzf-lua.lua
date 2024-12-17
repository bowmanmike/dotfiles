return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons", { "junegunn/fzf", build = "./install --bin" } },
		lazy = false,
		config = function()
			-- calling `setup` is optional for customization
			local fzf_lua = require("fzf-lua")

			fzf_lua.setup({ fzf_opts = { ["--layout"] = "default" } })

			vim.keymap.set("n", "<c-p>", fzf_lua.files, { noremap = true, silent = true, desc = "FZF Files" })
			vim.keymap.set("n", "<c-b>", fzf_lua.buffers, { noremap = true, silent = true, desc = "FZF Files" })
			vim.keymap.set(
				"n",
				"<leader><leader>",
				fzf_lua.oldfiles,
				{ noremap = true, silent = true, desc = "FZF Old Files" }
			)
			vim.keymap.set(
				"n",
				"<leader>rr",
				fzf_lua.lsp_references,
				{ noremap = true, silent = true, desc = "FZF Old Files" }
			)
			vim.keymap.set("n", "<leader>fh", fzf_lua.help_tags, { noremap = true, silent = true, desc = "FZF Help" })
			vim.keymap.set(
				"n",
				"<leader>tg",
				fzf_lua.git_status,
				{ noremap = true, silent = true, desc = "FZF Git Status" }
			)

			vim.api.nvim_create_user_command("Rg", fzf_lua.live_grep, { desc = "Search project by grep" })
		end,
	},
}
