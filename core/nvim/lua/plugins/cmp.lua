return {
  {
    "Saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      enabled = function()
        local filetype = vim.bo[0].filetype

        if filetype == "snacks_picker_input" then return false end
        return true
      end,
      sources = {
        default = { "copilot" },
        providers = {
          snippets = { score_offset = 9 },
          path = { score_offset = 8 },
          lsp = { score_offset = 0 },
          buffer = { score_offset = 0 },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = -1,
            async = true,
          },
        },
      },
      completion = {
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 3 }, { "source_name" } },
          },
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
    end,
  },
}
