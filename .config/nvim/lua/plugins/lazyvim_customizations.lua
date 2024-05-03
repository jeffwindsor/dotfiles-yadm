return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  { "L3MON4D3/LuaSnip", enabled = false },
  -- bufferline.nvim
  { "catppuccin/nvim", enabled = true },
  -- cmp-buffer
  -- cmp-path
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  -- conform.nvim
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.header = {
        "",
        "IKIGAI - a reason for being, a sense of purpose.",
        "WABI-SABI - acceptance and appreciation for imperfection.",
        "MOTTAINI - waste nothing.",
        "GAMAN - enduring the seemingly unbearable, with patience and dignity.",
        "ZAZEN - sitting meditation.",
        "MONO NO AWARE - awareness of the impermanent/transient nature of things. ",
        "",
        "",
        "          ░░ ░░░░ ░░          ",
        "          ░░ ░░░░ ░░          ",
        "          ░░ ░░░░ ░░          ",
        "          ░░ ░░░░ ░░          ",
        "          ░░ ░░░░ ░░          ",
        "          ░░ ░░░░ ░░          ",
        "         ░░░ ░░░░ ░░░         ",
        "        ░░░░ ░░░░ ░░░░        ",
        "      ░░░░░  ░░░░  ░░░░░      ",
        "    ░░░░     ░░░░     ░░░░    ",
        "░░░░░        ░░░░        ░░░░░",
        "░░░          ░░░░          ░░░",
        "",
        "",
      }
    end,
  },
  { "stevearc/dressing.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  -- gitsigns.nvim
  -- indent-blankline.nvim
  -- lualine.nvim
  -- mason-lspconfig.nvim
  -- mason.nvim
  -- mini.ai
  -- mini.bufremove
  -- mini.comment
  -- mini.indentscope
  { "mini.pairs", enabled = false },
  -- mini.surround
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  -- neoconf.nvim
  -- neodev.nvim
  { "folke/noice.nvim", enabled = false },
  -- nui.nvim
  -- nvim-cmp
  -- nvim-lint
  -- nvim-lspconfig
  -- nvim-notify
  { "rcarriga/nvim-notify", enabled = false },
  { "nvim-spectre", enabled = false },
  -- nvim-treesitter
  -- nvim-treesitter-context
  -- nvim-treesitter-textobjects
  -- nvim-ts-context-commentstring  { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
  -- nvim-web-devicons
  -- persistence.nvim
  -- plenary.nvim -- nvim-ts-autotag
  -- telescope-fzf-native.nvim
  -- telescope.nvim(optional),
  { "folke/todo-comments.nvim", enabled = false },
  -- tokyonight.nvim
  -- trouble.nvim
  -- vim-illuminate
  -- vim-startuptime
  {
    "folke/which-key.nvim",

    -- add or override by setting new value
    -- remove keyumap by setting equal to `nil`
    -- explained here : https://github.com/LazyVim/LazyVim/discussions/2588
    opts = function(_, opts)
      -- Name NEORG top level menu
      if require("lazyvim.util").has("neorg") then
        opts.defaults["<leader>e"] = { name = "+editor" }
        opts.defaults["<leader>ea"] = { name = "+align" }
        opts.defaults["<leader>e2"] = { name = "+2nd brain" }
      end

      -- Formatting
      opts.defaults["<leader>cf"] = { name = "+format" }
      opts.defaults["<leader>cfx"] = { "<cmd>%!xmllint --format - <cr>", "Format XML" }
      opts.defaults["<leader>cfs"] = { "<cmd>%!shfmt - <cr>", "Format Shell" }

      -- Open in external program
      opts.defaults["<leader>o"] = { "<cmd>!open %<cr>", "Open with default application" }
    end,
  },
}
