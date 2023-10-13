-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Resize window using <alt> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- windows
map("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

-- Move Cursor
map("i", "<C-f>", "<Right>", { desc = "Move cursor right", remap = true })
map("i", "<C-b>", "<Left>", { desc = "Move cursor left", remap = true })
map("i", "<C-a>", "<Home>", { desc = "Beginning of line", remap = true })
map("i", "<C-e>", "<End>", { desc = "End of line", remap = true })
