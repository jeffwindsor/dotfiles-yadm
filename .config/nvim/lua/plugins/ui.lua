-- Configuration File to override lazynvim options
--
return {

  {
    "folke/which-key.nvim",

    -- add or override by setting new value
    -- remove keyumap by setting equal to `nil`
    -- explained here : https://github.com/LazyVim/LazyVim/discussions/2588
    opts = function(_, opts)
      -- Name NEORG top level menu
      if require("lazyvim.util").has("neorg") then
        opts.defaults["<leader>n"] = { name = "+neorg" }
      end
    end,
  },

  -- colorschemes
  { "NLKNguyen/papercolor-theme" },
  { "catppuccin/nvim" },
  { "cocopon/iceberg.vim" },
  { "jacoborus/tender.vim" },
  { "joshdick/onedark.vim" },
  { "marko-cerovac/material.nvim" },
  { "metalelf0/jellybeans-nvim" },
  { "rebelot/kanagawa.nvim" },
  { "romainl/Apprentice" },
  { "shaunsingh/nord.nvim" },
  { "tomasr/molokai" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
