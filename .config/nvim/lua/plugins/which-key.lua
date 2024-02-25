return {
  "folke/which-key.nvim",

  -- add or override by setting new value
  -- remove keyumap by setting equal to `nil`
  -- explained here : https://github.com/LazyVim/LazyVim/discussions/2588
  opts = function(_, opts)
    opts.defaults["<leader>n"] = { name = "+neorg" }
  end,
}
