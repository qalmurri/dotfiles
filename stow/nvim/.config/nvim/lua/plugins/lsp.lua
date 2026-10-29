-- sudo pacman -S pyright lua-language-server gopls

-- v1
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.lsp.config("pyright", {})
      vim.lsp.config("gopls", {})
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })

      vim.lsp.enable("pyright")
      vim.lsp.enable("gopls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
    end,
  },
}

-- v.0
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--       "hrsh7th/cmp-nvim-lsp",
--     },
--     config = function()
--       require("mason").setup()
--       require("mason-lspconfig").setup({
--         ensure_installed = { "pyright", "lua_ls", "gopls" },
--         handlers = {
--           function(server_name)
--             require("lspconfig")[server_name].setup({
--               capabilities = require('cmp_nvim_lsp').default_capabilities(),
--             })
--           end,
--         },
--       })
--     end,
--   },
-- }
