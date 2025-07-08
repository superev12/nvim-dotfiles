return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})
	end,
	init = function()
		vim.keymap.set("n", "<leader>m", function()
			vim.cmd.SupermavenToggle()
			local is_running = require("supermaven-nvim.api").is_running()
			print("supermaven:", is_running)
		end)
	end,
}
