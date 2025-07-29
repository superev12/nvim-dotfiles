return {
	"nvim-treesitter/nvim-treesitter",
	--config = function()
	--	vim.cmd("TSUpdate")
	--end,
	setup = {
		ensure_installed = { "c", "lua", "markdown", "markdown_inline", "typescript", "javascript", "svelte" },
	},
}
