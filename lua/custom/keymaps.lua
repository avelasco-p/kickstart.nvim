-- Open Copilot Chat in a floating window
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle CopilotChat' })

-- Open Copilot Chat in a floating window with a prompt
vim.keymap.set('v', '<leader>cce', '<cmd>CopilotChatExplain<CR>', { desc = 'Explain CopilotChat (visual)' })
