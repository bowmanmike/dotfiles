local M = {}

local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	purple = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function hide_in_width()
	return vim.fn.winwidth(0) > 80
end

local lualine = require("lualine")
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			function()
				return " "
			end,
			padding = { left = 0, right = 0 },
			color = {},
			cond = nil,
		},
		lualine_b = {
			{
				"branch",
				icon = " ",
				color = { gui = "bold" },
				cond = hide_in_width,
			},
			{
				"diff",
				source = diff_source,
				symbols = { added = "  ", modified = "柳", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.yellow },
					removed = { fg = colors.red },
				},
				color = {},
				cond = nil,
			},
		},
		lualine_c = {
			"diagnostics",
			sources = { "nvim_lsp" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			color = {},
			-- This shows `true` in the status bar
			-- cond = hide_in_width,
		},
		lualine_x = {
			"treesitter",
			function()
				local b = vim.api.nvim_get_current_buf()
				if next(vim.treesitter.highlighter.active[b]) then
					return "  "
				end
				return ""
			end,
			color = { fg = colors.green, bg = colors.blue },
			-- cond = hide_in_width,
		},
		lualine_y = { "progress" },
		lualine_z = {
			"scrollbar",
			function()
				local current_line = vim.fn.line(".")
				local total_lines = vim.fn.line("$")
				local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
				local line_ratio = current_line / total_lines
				local index = math.ceil(line_ratio * #chars)
				return chars[index]
			end,
			padding = { left = 0, right = 0 },
			color = { fg = colors.yellow, bg = colors.bg },
			cond = nil,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
	tabline = {
		lualine_a = { "buffers" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "tabs" },
	},
})

return M
