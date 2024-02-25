return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = ":Neorg sync-parsers",
  lazy = true, -- enable lazy load
  ft = "norg", -- lazy load on file type
  cmd = "Neorg", -- lazy load on command
  keys = {
    { "<leader>n", "", desc = "+neorg" },
    { "<leader>ne", "<cmd>Neorg index<cr>", desc = "enter" },
    { "<leader>nl", "<cmd>Neorg return<cr>", desc = "leave" },
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              exocortex = "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/exocortex",
            },
            default_workspace = "exocortex",
          },
        },
      },
    })
  end,
}
