return {
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
}
