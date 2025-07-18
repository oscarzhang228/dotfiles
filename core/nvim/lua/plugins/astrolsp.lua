return {
  "AstroNvim/astrolsp",
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        ignore_filetypes = { "markdown", "text" },
      },
      disabled = {
        "basedpyright",
      },
      timeout_ms = 20000,
    },
    servers = {},
    config = {
      basedpyright = {
        settings = {
          basedpyright = {
            disableOrganizeImports = true, -- Using Ruff
            analysis = {
              typeCheckingMode = "standard",
            },
          },
          python = {
            analysis = {
              ignore = { "*" }, -- Using Ruff
            },
          },
        },
      },
    },
    handlers = {},
    autocmds = {},
    mappings = {
      n = {},
    },
    on_attach = function(client, bufnr) end,
  },
}
