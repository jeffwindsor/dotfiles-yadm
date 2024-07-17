return {
  -- COLOR SCHEMES
  { "rebelot/kanagawa.nvim" },
  { "NTBBloodbath/doom-one.nvim" },
  --{ "HoNamDuong/hybrid.nvim" },
  --{ "marko-cerovac/material.nvim" },
  { "folke/tokyonight.nvim" },
  { "jacoborus/tender.vim" },

  -- LAZYVIM
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "doom-one" },
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.header = {
        "",
        "",
        "          ░░░░░░░░          ",
        "      ░░░░░░░░░░░░░░░░      ",
        "    ░░░░░░░░░░░░░░░░░░░░    ",
        "  ░░░░░░    ░░░░░░░░    ░░  ",
        "  ░░░░        ░░░░          ",
        "  ░░░░    ▒▒▒▒░░░░    ▒▒▒▒  ",
        "░░░░░░    ▒▒▒▒░░░░    ▒▒▒▒░░",
        "░░░░░░░░    ░░░░░░░░    ░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░  ░░░░░░    ░░░░░░  ░░░░",
        "░░      ░░░░    ░░░░      ░░",
        "",
        "",
        "neovim",
        "",
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      level = 3,
      render = "minimal",
      stages = "static",
    },
  },
  -- ---------------------------------------------------
  -- TURN OFF LAZYVIM PLUGINS
  { "echasnovski/mini.pairs", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}

-- '"=^)',
-- "",
-- "MOTTAINI ❀ waste nothing",
-- "ZAZEN ☸ sitting meditation",
-- "OUBAITORY ❀ do not compare yourself to others",
-- "IKIGAI ☸ a reason for being, a sense of purpose",
-- "SHIKATA GA NAI ❀ let go of what you cannot change",
-- "SHU-HA-RI ☸ three stage to aquiring true knowledge",
-- "KAIZEN ❀ always seek to improve all areas of your life",
-- "WABI SABI ☸ acceptance and appreciation for imperfection",
-- "GAMAN ❀ enduring the seemingly unbearable, with patience and dignity",
-- "MONO NO AWARE ☸ awareness of the impermanent/transient nature of things",
