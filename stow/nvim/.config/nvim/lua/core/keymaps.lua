local keymap = vim.keymap

-- Neo-tree
keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true, desc = "Toggle Explorer" })

-- Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })

-- LSP Attach Maps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})
