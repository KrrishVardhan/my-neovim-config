return {
  "stevearc/conform.nvim",

  event = { "BufWritePre" },

  opts = {
    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },

      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },

      blade = { "blade_formatter" },
      php = { "php_cs_fixer" },
    },

    formatters = {
        blade_formatter = {
            command = "blade-formatter",
            args = { "--write", "$FILENAME" },
            stdin = false,
        },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },

  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({
          async = true,
          lsp_format = "fallback",
        })
      end,
      desc = "Format buffer",
    },
  },
}
