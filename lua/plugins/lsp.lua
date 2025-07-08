return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
      },
    },
    'nvimtools/none-ls.nvim',
  },
  config = function()

    require("mason").setup {
      ui = {
        border = "rounded",
      },
    }

    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "pyright",
        "bashls",
        "jsonls",
      },
      
      handlers = {
        ts_ls = function()
          print("loading ts_ls")
          local nvim_lsp = require("lspconfig")
          nvim_lsp.ts_ls.setup {
            root_dir = nvim_lsp.util.root_pattern("package.json"),
            settings = {
              single_file_support = false,
            },
          }
        end,
      },
    }

    require("mason-lspconfig").setup_handlers {
      function (server_name)
        require("lspconfig")[server_name].setup {}
      end,
    }

    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.hover.dictionary,
        null_ls.builtins.hover.printenv,
      },
    })

  end
}
