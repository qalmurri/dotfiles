return {
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      local clangd_extensions = require("clangd_extensions")

      clangd_extensions.setup({
        server = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=iwyu",
          },
        },
        extensions = {
          autoSetHints = true,
          inlay_hints = {
            inline = true,
          },
        },
      })
    end,
  },
}
