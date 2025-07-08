-- Theme
vim.cmd.colorscheme("quiet")

-- Tabs
vim.opt.expandtab = true -- Use spaces by default
vim.opt.shiftwidth = 2 -- Set amount of space characters, when we press "<" or ">"
vim.opt.tabstop = 2 -- 1 tab equal 2 spaces
vim.opt.smartindent = true -- Turn on smart indentation. See in the docs for more info
vim.opt.list = true -- Turn on list mode
vim.opt.listchars = "tab:▸ ,trail:🞙,nbsp:▸" -- Show tabs and trailing spaces

-- Clipboard
-- vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.fixeol = false -- Turn off appending new line in the end of a file
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

-- Folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"

-- Numbered lines
vim.opt.number = true

-- Search
vim.opt.ignorecase = true -- Ignore case if all characters in lower case
vim.opt.joinspaces = false -- Join multiple spaces in search
vim.opt.smartcase = true -- When there is a one capital letter search for exact match
vim.opt.showmatch = true -- Highlight search instances

-- Window
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new vertical splits to right

-- Wild Menu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

-- Default Plugins
local disabled_built_ins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

-- LSP diagnostics
vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	signs = false,
})
vim.o.signcolumn = "no"
vim.o.statuscolumn = ""

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
