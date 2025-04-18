---@type LazySpec

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "typescript",
      "javascript",
      "http",
      "cpp",
      "java",
      "regex",
    },
    highlight = {
      enable = true,
    },
  },
}
