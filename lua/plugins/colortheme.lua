return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("tokyonight-night")

        vim.opt.fillchars = {
            eob = " ",
        }

        local transparent_groups = {
            "Normal",
            "NormalNC",
            "NormalFloat",
            "FloatBorder",
            "SignColumn",
            "EndOfBuffer",
            "MsgArea",
            "NvimTreeNormal",
            "NvimTreeNormalNC",
        }

        for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
    end,
}
