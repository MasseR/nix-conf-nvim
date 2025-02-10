require('lualine').setup(
  -- Default configuration
  {
    options = {
      icons_enabled = true,
      -- It's using the pywal generated zenburn theme
      -- pywal seems to be a python script for generating themes. I ran 'pywal
      -- --theme zenburn' which creates a ~/.cache/wal/colors.sh
      --
      -- By setting the theme to pywal, should set the colors.sh
      -- but this means, that the theme requires running cmdline programs and
      -- is not fully encapsulated
      theme = 'pywal',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
)
