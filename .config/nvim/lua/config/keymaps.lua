-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--vim.keymap.set
-- vim.keymap.set("n", "<leader>cfx", "<cmd>%!xmllint --format - <cr>", { desc = "Format Selected XML" })
-- vim.keymap.set("n", "<leader>y", "", { desc = "+Other" })
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open current directory" })
