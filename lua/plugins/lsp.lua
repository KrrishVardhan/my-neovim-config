return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
          "mason-org/mason.nvim",
          "neovim/nvim-lspconfig",
        },
        opts = {
          ensure_installed = {
            "ts_ls",
            "html",
          },
          automatic_enable = true,
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    version = "1.*",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
        },
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },
    },

    opts_extend = {
      "sources.default",
    },
  },
}
