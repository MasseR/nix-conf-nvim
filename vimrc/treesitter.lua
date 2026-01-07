local treesitter = require('nvim-treesitter')
treesitter.setup()
-- treesitter.install {'nix', 'haskell'}
vim.api.nvim_create_autocmd('FileType', {
  pattern =
  { 'arduino',
    'haskell',
    'nix',
    'typescript',
    'clojure',
    'markdown',
    'yaml',
    'dhall',
    'json',
    'gitcommit',
    'gitignore',
    'mermaid',
    'elixir',
    'rust'
  },
  callback = function()
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

local textobjects = require('nvim-treesitter-textobjects')
textobjects.setup{
    select = {
      enable = true,

      lookahead = true,
    }
}

vim.keymap.set({"x", "o"}, "af", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end, { desc = "Select around a function" })
vim.keymap.set({"x", "o"}, "if", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end, { desc = "Select inside a function" })
vim.keymap.set({"x", "o"}, "ac", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end, { desc = "Select around a class" })
vim.keymap.set({"x", "o"}, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end, { desc = "Select inner part of class region" })
vim.keymap.set({"x", "o"}, "aa", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@node.outer", "textobjects")
end, { desc = "Select around a generic node" })
vim.keymap.set({"x", "o"}, "ia", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@node.inner", "textobjects")
end, { desc = "Select inside a generic node" })
vim.keymap.set({"x", "o"}, "ab", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@block.outer", "textobjects")
end, { desc = "Select around a block" })
vim.keymap.set({"x", "o"}, "ib", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@block.inner", "textobjects")
end, { desc = "Select inside a block" })
vim.keymap.set({"x", "o"}, "ap", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
end, { desc = "Select around a parameter" })
vim.keymap.set({"x", "o"}, "ip", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inside a parameter" })
vim.keymap.set({"x", "o"}, "am", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@comment.outer", "textobjects")
end, { desc = "Select around a comment" })
vim.keymap.set({"x", "o"}, "im", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@comment.inner", "textobjects")
end, { desc = "Select inside a comment" })
