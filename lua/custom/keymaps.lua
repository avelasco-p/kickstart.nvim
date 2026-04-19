-- Open Copilot Chat in a floating window
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle CopilotChat' })

-- Open Copilot Chat in a floating window with a prompt
vim.keymap.set('v', '<leader>cce', '<cmd>CopilotChatExplain<CR>', { desc = 'Explain CopilotChat (visual)' })

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("Shift-y>")', { expr = true, replace_keycodes = false })

-- Yanking to clipboard
vim.keymap.set('v', '<leader>y', '"+y')
