return {
	{
		"folke/sidekick.nvim",
		event = "InsertEnter",
		opts = {
			cli = {
				mux = {
					backend = "tmux",
					enabled = true,
				},
			},
		},
		keys = {
			-- {
			-- 	"<tab>",
			-- 	function()
			-- 		-- if there is a next edit, jump to it, otherwise apply it if any
			-- 		if require("sidekick").nes_jump_or_apply() then
			-- 			return -- jumped or applied
			-- 		end
			--
			-- 		-- if you are using Neovim's native inline completions
			-- 		if vim.lsp.inline_completion.get() then
			-- 			return
			-- 		end
			--
			-- 		-- any other things (like snippets) you want to do on <tab> go here.
			--
			-- 		-- fall back to normal tab
			-- 		return "<tab>"
			-- 	end,
			-- 	mode = { "i", "n" },
			-- 	expr = true,
			-- 	desc = "Goto/Apply Next Edit Suggestion",
			-- },
			{
				"<leader>aa",
				function()
					require("sidekick.cli").toggle()
				end,
				desc = "Sidekick Toggle CLI",
			},
			{
				"<leader>as",
				function()
					require("sidekick.cli").select()
				end,
				desc = "Sidekick Select Tool",
			},
			{
				"<leader>at",
				function()
					require("sidekick.cli").send({ msg = "{this}", submit = true })
				end,
				desc = "Send This",
			},
			{
				"<leader>av",
				function()
					require("sidekick.cli").send({ msg = "{selection}", submit = true })
				end,
				mode = { "x" },
				desc = "Send Visual Selection",
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt()
				end,
				mode = { "n", "x" },
				desc = "Sidekick Select Prompt",
			},
			{
				"<c-.>",
				function()
					require("sidekick.cli").focus()
				end,
				mode = { "n", "i", "t" },
				desc = "Sidekick Switch Focus",
			},
			{
				"<leader>ac",
				function()
					require("sidekick.cli").toggle({ name = "claude", submit = false })
				end,
				desc = "Toggle Claude",
			},
		},
	},
}
