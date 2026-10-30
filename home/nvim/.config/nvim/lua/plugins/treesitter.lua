-- v.1
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },

    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "bash",
        "python",
        "go",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },

    config = function(_, opts)
      local ok, ts = pcall(require, "nvim-treesitter.configs")
      if ok then
        ts.setup(opts)
      end
    end,
  },
}

-- v.0
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     event = { "BufReadPost", "BufNewFile" }, -- Load hanya saat buka file agar startup cepat
--     config = function()
--       local status, treesitter = pcall(require, "nvim-treesitter.configs")
--       if not status then
--         treesitter = require("nvim-treesitter")
--       end
-- 
--       treesitter.setup({
--         ensure_installed = { "python", "lua", "vim", "vimdoc", "go", "cpp", "bash" },
--         auto_install = true,
--         highlight = {
--           enable = true, -- Aktifkan highlight warna-warni
--           additional_vim_regex_highlighting = false,
--         },
--         indent = { enable = true }, -- Indentasi otomatis yang lebih pintar
--       })
--     end
--   },
-- }
