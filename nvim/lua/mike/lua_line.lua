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
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				function()
					return " "
				end,
				padding = { left = 1, right = 1 },
				color = {},
				cond = nil,
			},
		},
		lualine_b = {
			{
				"branch",
				icon = " ",
				color = { gui = "bold" },
				cond = hide_in_width,
			},
			{ "filename" },
		},
		lualine_c = {
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
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				color = {},
				-- This shows `true` in the status bar
				cond = hide_in_width,
			},
			{
				function()
					local b = vim.api.nvim_get_current_buf()
					if next(vim.treesitter.highlighter.active[b]) then
						return "  "
					end
					return "treesitter"
				end,
				color = { fg = colors.green },
				cond = hide_in_width,
			},
			{
				function(msg)
					msg = msg or "LS Inactive"
					local buf_clients = vim.lsp.buf_get_clients()
					if next(buf_clients) == nil then
						-- TODO: clean up this if statement
						if type(msg) == "boolean" or #msg == 0 then
							return "LS Inactive"
						end
						return msg
					end
					-- local buf_ft = vim.bo.filetype
					local buf_client_names = {}

					-- add client
					for _, client in pairs(buf_clients) do
						if client.name ~= "null-ls" then
							table.insert(buf_client_names, client.name)
						end
					end

					-- add formatter
					-- local formatters = require("lvim.lsp.null-ls.formatters")
					-- local supported_formatters = formatters.list_registered_providers(buf_ft)
					-- vim.list_extend(buf_client_names, supported_formatters)

					-- add linter
					-- local linters = require("lvim.lsp.null-ls.linters")
					-- local supported_linters = linters.list_registered_providers(buf_ft)
					-- vim.list_extend(buf_client_names, supported_linters)

					return table.concat(buf_client_names, ", ")
				end,
				icon = " ",
				color = {},
			},
			{ "filetype", cond = hide_in_width, color = {} },
		},
		lualine_y = {},
		lualine_z = {
			{
				function()
					local current_line = vim.fn.line(".")
					local total_lines = vim.fn.line("$")
					local chars = {
						"__",
						"▁▁",
						"▂▂",
						"▃▃",
						"▄▄",
						"▅▅",
						"▆▆",
						"▇▇",
						"██",
					}
					local line_ratio = current_line / total_lines
					local index = math.ceil(line_ratio * #chars)
					return chars[index]
				end,
				padding = { left = 0, right = 0 },
				color = { fg = colors.yellow, bg = colors.bg },
				cond = nil,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
	tabline = {
		lualine_a = { { "buffers", show_filename_only = false } },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "tabs" },
	},
})

return M
