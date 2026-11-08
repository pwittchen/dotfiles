-- Match the nox terminal background (theme "vitesse": dark #121212, light #ffffff)
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      on_colors = function(c)
        if vim.o.background == "light" then
          c.bg = "#ffffff"
          c.bg_dark = "#f7f7f7"
          c.bg_float = "#f7f7f7"
          c.bg_sidebar = "#f7f7f7"
        else
          c.bg = "#1a1a1a"
          c.bg_dark = "#151515"
          c.bg_float = "#151515"
          c.bg_sidebar = "#151515"
          c.bg_highlight = "#262626" -- cursorline, neutral grey instead of blue
          c.bg_statusline = "#151515"
        end
      end,
    },
  },
}
