return {

  {
    "folke/tokyonight.nvim",
    opts = {
      -- transparency
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },

      -- visibility
      on_highlights = function(hl, c)
        -- increase visibility of window separators (horz & vert)
        hl.WinSeparator = { bold = true, fg = c.cyan }
        -- increase visibility of line numbers
        hl.CursorLineNr = { bold = true, fg = c.orange }
        hl.LineNr = { fg = c.orange }
        hl.LineNrAbove = { fg = c.comment }
        hl.LineNrBelow = { fg = c.comment }
      end,
    },
  },
  -- { "AlexvZyl/nordic.nvim" },
  -- { "Daiki48/sakurajima.nvim" },
  -- { "bluz71/vim-nightfly-colors" },
  -- { "loctvl842/monokai-pro.nvim" },
  -- { "sainnhe/everforest" },
  -- { "NTBBloodbath/doom-one.nvim" },
  { "jacoborus/tender.vim" },
  { "navarasu/onedark.nvim" },
  { "rebelot/kanagawa.nvim" },
  -- { "rmehri01/onenord.nvim" },
  { "shaunsingh/nord.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
    },
  },
}
