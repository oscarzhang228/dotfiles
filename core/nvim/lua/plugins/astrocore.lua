---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
      },
    },
    mappings = {
      n = {
        -- File Utils
        ["<Leader>fr"] = {
          function() require("snacks.picker").lsp_references() end,
          nowait = true,
          desc = "Find references",
        },
        ["<Leader>o"] = {
          [[<CMD>Oil<CR>]],
          desc = "Open Oil",
        },
        ["<Leader>x"] = {
          desc = require("mini.icons").get("filetype", "Trouble") .. " Trouble / QFlist",
        },

        -- Harpoon
        ["<Leader>h"] = { desc = require("mini.icons").get("filetype", "Harpoon") .. " Harpoon" },
        ["<Leader>hm"] = {
          [[<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>]],
          desc = "Toggle Harpoon Quick Menu",
        },
        ["<Leader>ha"] = {
          [[<CMD>lua require('harpoon.mark').add_file()<CR>]],
          desc = "Add File to Harpoon",
        },
        ["<Leader>hn"] = {
          [[<CMD>lua require('harpoon.ui').nav_next()<CR>]],
          desc = "Go to next Harpoon mark",
        },
        ["<Leader>hp"] = {
          [[<CMD>lua require('harpoon.ui').nav_prev()<CR>]],
          desc = "Go to previous Harpoon mark",
        },
        -- END Harpoon

        -- Git
        ["<Leader>gt"] = false,
        ["<Leader>gb"] = false,
        ["<Leader>gc"] = false,
        ["<Leader>gC"] = false,
        ["<Leader>gT"] = false,
        -- END Git

        -- Misc
        ["n"] = {
          [[nzz]],
        },
        ["N"] = {
          [[Nzz]],
        },
        ["<Leader>P"] = {
          [["0p]],
          desc = "Paste last yanked",
        },
        ["s"] = false,

        -- End Misc

        -- Use oil instead
        ["<Leader>n"] = false,
        ["<Leader>R"] = false,
        -- Never used force close buffer
        ["<Leader>C"] = false,
      },

      t = {
        -- terminal escape
        ["<Esc>"] = [[<C-\><C-n>]],
      },
    },
  },
}
