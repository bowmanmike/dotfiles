require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
ls.filetype_extend("ruby", { "rails" })
ls.filetype_extend("heex", { "html" })

local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node

ls.add_snippets("all", {
	s("daily", {
		t("# " .. os.date("%Y-%m-%d")),
		t({"", ""}),
		t({"", ""}),
	}),
})
