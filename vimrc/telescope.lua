-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")


vim.keymap.set('n', '<Leader>lf', function()
    require'telescope.builtin'.find_files{}
end, { noremap = true, silent = true, desc = "Find Files" })

vim.keymap.set('n', '<Leader>lb', function()
    require'telescope.builtin'.buffers{}
end, { noremap = true, silent = true, desc = "List Buffers" })

vim.keymap.set('n', '<Leader>ff', function()
    require'telescope.builtin'.live_grep{}
end, { noremap = true, silent = true, desc = "Live Grep" })

-- Note, that I tried the treesitter objects as well, but it's buggy on most of
-- the files I use. Well, probably not telescope itself, but the treesitter
-- that provides the items
-- Tested in haskell, nix and lua (this file).
--
-- - Lua didn't provide anything
-- - Nix worked best, but the values were somewhat useless
-- - Haskell reported an error, similar to https://github.com/nvim-telescope/telescope.nvim/issues/3163
