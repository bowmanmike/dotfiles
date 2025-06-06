return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		tag = "v3.11.1",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			debug = false, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
		event = "VeryLazy",
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<CR>", { noremap = true, silent = true } },
		},
	},
}
