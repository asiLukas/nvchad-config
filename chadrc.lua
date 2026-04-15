local M = {}

M.base46 = {
  theme = "gruvbox",
  transparency = false,

  changed_themes = {
    gruvbox = {
      base_16 = {
        base00 = "#32302f",
      },
      base_30 = {
        black = "#282828",
        base00 = "#32302f",
      },
    },
  },

  hl_override = {
    Comment = {
      italic = true,
    },
    Keyword = {
      italic = true,
      bold = true,
    },
    Function = {
      bold = true,
    },
    String = {
      italic = true,
    },
    Identifier = {
      bold = true,
    },
  },
}

return M
