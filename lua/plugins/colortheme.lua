local transparent = false

local function load_theme()
  require("tokyonight").setup({
    style = "night",
    transparent = transparent,

    styles = {
      sidebars = transparent and "transparent" or "dark",
      floats = transparent and "transparent" or "dark",
    },
  })

  vim.cmd.colorscheme("tokyonight")
end

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    load_theme()

    vim.keymap.set("n", "<leader>bg", function()
      transparent = not transparent
      load_theme()
    end, { desc = "Toggle Background Transparency" })
  end,
}
