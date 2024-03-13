return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = function(_, opts)
    -- bind cwd to neo-tree root
    opts.filesystem.bind_to_cwd = true
  end,
}
