return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    --config = function()
    --  require("oil").setup()
    --  vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Parent Directory" })
    --end,
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "File Manager",
      },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
  },
}
