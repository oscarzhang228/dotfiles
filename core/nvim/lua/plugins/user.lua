return {
  {
    "mistweaverco/kulala.nvim",
    opts = {
      ui = {
        show_icons = "above_request",
        formatter = true,
        display_mode = "float",
        winbar = false,
      },
    },
    ft = { "http" },
  },
  { "echasnovski/mini.surround", version = false, opts = {} },
  {
    "cbochs/grapple.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      scope = "git_branch",
      icons = true,
      quick_select = "123456789",
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
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        enabled = true,
        hidden = true,
      },
      notifer = {
        enabled = true,
        style = "compact",
        top_down = "false",
      },
      scratch = {
        enabled = true,
        filekey = {
          cwd = true,
          count = false,
          branch = false,
        },
      },
      bigfile = {
        enabled = true,
      },
      quickfile = {
        enabled = true,
      },
      indent = {
        enabled = true,
        current_scope = true,
        indent = {
          enabled = false,
        },
        chunk = {
          enabled = true,
          char = {
            corner_top = "╭",
            corner_bottom = "╰",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
        },
      },
    },
    keys = {},
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    opts = {
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, _)
          local m = name:match "^%."
          return m ~= nil
        end,
        natural_order = "fast",
        case_insensitive = false,
        sort = {
          { "type", "asc" },
          { "name", "asc" },
        },
      },
      watch_for_changes = false,
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = { bottom_search = false },
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {},
  },
  {
    "danymat/neogen",
    opts = {},
  },
}
