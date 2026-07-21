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
            "emmet_language_server",
            "intelephense",
            -- "jdtls",
          },
          automatic_enable = true,
        },
      },
    },
    config = function()
        vim.lsp.config("emmet_language_server", {
            filetypes = {
                "html",
                "css",
                "javascriptreact",
                "typescriptreact",
            },
        })

        vim.lsp.enable("emmet_language_server")

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })
    end,
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
