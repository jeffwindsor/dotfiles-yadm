return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight-moon",
      colorscheme = "ayu-mirage",
    },
  },

  -- FAVORITE THEMES
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
  { "jacoborus/tender.vim" },
  { "rebelot/kanagawa.nvim" },
  { "shaunsingh/nord.nvim" },
  { "Shatur/neovim-ayu" },

  -- ON DECK
  { "AlexvZyl/nordic.nvim" },
  { "Daiki48/sakurajima.nvim" },
  { "NTBBloodbath/doom-one.nvim" },
  { "bluz71/vim-nightfly-colors" },
  { "ellisonleao/gruvbox.nvim" },
  { "kepano/flexoki-neovim" },
  { "loctvl842/monokai-pro.nvim" },
  { "navarasu/onedark.nvim" },
  { "0xstepit/flow.nvim" },
  { "rmehri01/onenord.nvim" },
  { "sainnhe/everforest" },
  { "savq/melange-nvim" },
  { "LunarVim/synthwave84.nvim" },
  { "maxmx03/fluoromachine.nvim" },
  { "samharju/synthweave.nvim" },
}
