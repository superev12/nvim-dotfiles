local util = require("util")

local formatters_by_ft = {
	lua = { "stylua" },
	yaml = { "yamlfmt" },
	json = { "biome" },
	css = { "biome" },
	html = { "biome" },
	svelte = { "biome" },
	javascript = {
		"biome",
		"eslint-lsp",
	},
	typescript = {
		"biome",
		"eslint-lsp",
	},
	javascriptreact = {
		"biome",
		-- "rustywind",
		"eslint-lsp",
	},
	typescriptreact = {
		"biome",
		-- "rustywind",
		"eslint-lsp",
	},
	python = {
		"black",
	},
}

local formatters = {}

for ft, formattersTable in pairs(formatters_by_ft) do
	for _, formatter in pairs(formattersTable) do
		table.insert(formatters, formatter)
	end
end

return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	dependencies = { { "williamboman/mason.nvim", lazy = true } },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format()
			end,
		},
	},
	opts = {
		formatters_by_ft = formatters_by_ft,
	},
	init = function()
		util.install_mason_packages(formatters)
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
