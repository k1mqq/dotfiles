vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)", { noremap = false })

vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'FzfFiles' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<CR>', { desc = 'FzfLiveGrep' })
