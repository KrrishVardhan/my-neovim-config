return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  opts = {
    ensure_installed = {
      'lua', 'python', 'javascript', 'typescript', 'vimdoc', 'vim',
      'regex', 'terraform', 'sql', 'dockerfile', 'toml', 'json',
      'java', 'groovy', 'go', 'gitignore', 'graphql', 'yaml', 'make',
      'cmake', 'markdown', 'markdown_inline', 'bash', 'tsx', 'jsx',
      'css', 'html', 'php', 'blade',
    },
  },
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
