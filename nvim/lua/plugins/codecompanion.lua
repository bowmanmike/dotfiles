return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.pick",
		"echasnovski/mini.diff",
		{
			"ravitemer/mcphub.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
			},
			-- uncomment the following line to load hub lazily
			--cmd = "MCPHub",  -- lazy load
			build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
			-- uncomment this if you don't want mcp-hub to be available globally or can't use -g
			-- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
		},
	},
	tag = "v15.3.0",
	opts = {
		strategies = {
			chat = {
				adapter = "anthropic",
			},
			inline = {
				adapter = "anthropic",
			},
		},
		display = {
			action_palette = {
				width = 95,
				height = 10,
				prompt = "Prompt ", -- Prompt used for interactive LLM calls
				provider = "mini_pick", -- Can be "default", "telescope", or "mini_pick". If not specified, the plugin will autodetect installed providers.
				opts = {
					show_default_actions = true, -- Show the default actions in the action palette?
					show_default_prompt_library = true, -- Show the default prompt library in the action palette?
				},
			},
			diff = {
				enabled = true,
				close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
				layout = "vertical", -- vertical|horizontal split for default provider
				opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
				provider = "mini_diff", -- default|mini_diff
			},
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					show_result_in_chat = true, -- Show mcp tool results in chat
					make_vars = true, -- Convert resources to #variables
					make_slash_commands = true, -- Add prompts as /slash commands
				},
			},
		},
	},
}
