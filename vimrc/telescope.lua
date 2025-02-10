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
end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>lb', function()
    require'telescope.builtin'.buffers{}
end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>ff', function()
    require'telescope.builtin'.live_grep{}
end, { noremap = true, silent = true })
