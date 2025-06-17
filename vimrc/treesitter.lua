require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- Can have description for which-key
        ["ic"] = { query = "@class.inner", desc = "Select inner part of class region" },


        ["aa"] = { query = "@node.outer", desc = "Select around a generic node" },
        ["ia"] = { query = "@node.inner", desc = "Select inside a generic node" },


        -- You might also find these useful for more granular control:
        -- Around blocks (like if/for/while bodies)
        ["ab"] = { query = "@block.outer", desc = "Select around a block" },
        ["ib"] = { query = "@block.inner", desc = "Select inside a block" },

        -- Around parameters/arguments (e.g., in function calls or definitions)
        ["ap"] = { query = "@parameter.outer", desc = "Select around a parameter" },
        ["ip"] = { query = "@parameter.inner", desc = "Select inside a parameter" },

        -- Around comments
        ["am"] = { query = "@comment.outer", desc = "Select around a comment" },
        ["im"] = { query = "@comment.inner", desc = "Select inside a comment" },
      },
    }
  }
}
