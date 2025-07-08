-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      "<leader>p",
      "<cmd>Telescope find_files<cr>",
      desc = "Find Files"
    },
    {
      "<leader>/",
      "<cmd>Telescope live_grep<cr>",
      desc = "Live Grep"
    },
  }
}
