return {
	-- slows things a bit
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		vim.keymap.set("n", "gha", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "ghp", function()
			harpoon:list():prev({ ui_nav_wrap = true })
		end)
		vim.keymap.set("n", "ghn", function()
			harpoon:list():next({ ui_nav_wrap = true })
		end)
	end,
}
