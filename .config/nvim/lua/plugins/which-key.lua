return {
  "folke/which-key.nvim",

  -- add or override by setting new value
  -- remove keyumap by setting equal to `nil`
  -- explained here : https://github.com/LazyVim/LazyVim/discussions/2588
  opts = function(_, opts)
    -- Name NEORG top level menu
    if require("lazyvim.util").has("neorg") then
      opts.defaults["<leader>2"] = { name = "+2nd brain" }
    end
  end,
}
