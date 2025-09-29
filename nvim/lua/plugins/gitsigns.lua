return {
	"lewis6991/gitsigns.nvim",
	-- cmd = "VeryLazy",
	lazy = false,
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			-- add = { text = "│" },
			-- change = { text = "│" },
			-- delete       = { text = '_' },
			-- topdelete    = { text = '‾' },
			-- changedelete = { text = '~' },
			-- untracked    = { text = '┆' },
		},
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 300,
			ignore_whitespace = false,
		},

		on_attach = function(bufnr)
			vim.keymap.set(
				"n",
				"<leader>gh",
				require("gitsigns").preview_hunk,
				{ buffer = bufnr, desc = "Preview git hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>hu",
				require("gitsigns").reset_hunk,
				{ buffer = bufnr, desc = "Undo git hunk" }
			)

			-- don't override the built-in and fugitive keymaps
			local gs = package.loaded.gitsigns
			vim.keymap.set({ "n", "v" }, "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
			vim.keymap.set({ "n", "v" }, "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
		end,
	},
}
