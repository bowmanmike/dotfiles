return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	event = "InsertEnter",
	dependencies = {
		{
			"giuxtaposition/blink-cmp-copilot",
		},
	},
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
