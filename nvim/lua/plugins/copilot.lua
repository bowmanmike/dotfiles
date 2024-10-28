return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	event = "InsertEnter",
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
	},
	config = function()
		require("copilot").setup({
			suggestion = { enable = false },
			panel = { enable = false },
		})
	end,
}
