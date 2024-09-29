require('nightfox').setup({
  palettes = {
    nordfox = {
      bg0 = "#131a24", -- Dark bg (status line and float)
      bg1 = "#192330", -- Default bg
      bg2 = "#212e3f", -- Lighter bg (colorcolm folds)
      bg3 = "#29394f", -- Lighter bg (cursor line)
      bg4 = "#39506d", -- Conceal, border fg
    },
  },
})

vim.cmd("colorscheme nordfox")
