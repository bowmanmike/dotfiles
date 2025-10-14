return {
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	-- cmd = "Copilot",
	-- 	-- event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		enabled = false,
		-- event = "VeryLazy",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.config.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					per_filetype = {
						codecompanion = { "codecompanion" },
					},
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "emoji" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = require("tailwindcss-colorizer-cmp").formatter,
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
		dependencies = {
			"roobert/tailwindcss-colorizer-cmp.nvim",
			"hrsh7th/cmp-cmdline",
		},
	},
	{ "hrsh7th/cmp-nvim-lsp", enabled = false },
	{ "hrsh7th/cmp-emoji", enabled = false },
	{
		"L3MON4D3/LuaSnip",
		enabled = false,
		dependencies = {
			{
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		},
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"giuxtaposition/blink-cmp-copilot",
		},

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "enter" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
				kind_icons = {
					Copilot = "",
				},
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				documentation = { auto_show = false },
				ghost_text = { enabled = true },
				list = { selection = {
					preselect = true,
					auto_insert = true,
				} },
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
								item.kind_icon = ""
								item.kind_name = "Copilot"
							end
							return items
						end,
					},
					cmdline = {
						-- min_keyword_length = function(ctx)
						-- 	-- Require 3 chars for the first word in cmdline, 0 for subsequent words
						-- 	if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
						-- 		return 3
						-- 	end
						-- 	return 0
						-- end,
					},
				},
			},

			-- Cmdline completion configuration
			cmdline = {
				enabled = true,
				keymap = { preset = "cmdline" },
				completion = {
					list = {
						selection = {
							preselect = false, -- Automatically select first item
							auto_insert = true, -- Don't auto-insert, wait for <CR> or <Tab>
						},
					},
					menu = {
						auto_show = function(ctx)
							return vim.fn.getcmdtype() == ":"
							-- enable for inputs as well, with:
							-- or vim.fn.getcmdtype() == '@'
						end,
					},
					ghost_text = { enabled = true },
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
