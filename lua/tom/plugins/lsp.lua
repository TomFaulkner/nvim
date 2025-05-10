return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    -- CMP setup
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -- Additional plugin setups
    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
      },
      auto_install = true,
      handlers = {
        function(server_name) -- Default handler
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                },
              },
            },
          })
        end,
      },
    })

    -- Ruff LSP setup (linting, formatting, hover)
    require("lspconfig").ruff.setup({
      capabilities = capabilities,
      init_options = {
        settings = {
          args = {},
          configurationPreference = "filesystemFirst",
        },
      },
      on_attach = function(client, bufnr)
        -- Enable formatting and diagnostics
        client.server_capabilities.documentFormattingProvider = true
        -- Enable hover
        -- client.server_capabilities.hoverProvider = true
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.completionProvider = false
        -- Format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, async = false })
          end,
        })
        -- Map K to hover (buffer-local)
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover documentation" })
      end,
    })

    -- Basedpyright setup (navigation only)
    require("lspconfig").basedpyright.setup({
      capabilities = capabilities,
      settings = {
        basedpyright = {
          autoImportCompletion = false,
          disableOrganizeImports = true,
          analysis = {
            typeCheckingMode = "recommended",
            diagnosticMode = "openFilesOnly",
            diagnosticSeverityOverrides = {
              reportMissingImports = "none",
              reportUnusedVariable = "none",
              reportUndefinedVariable = "none",
              reportGeneralTypeIssues = "none",
              reportOptionalMemberAccess = "none",
              reportImplicitStringConcatenation = "none",
            },
          },
        },
        python = {
          pythonPath = vim.fn.systemlist("poetry env info -p")[1] .. "/bin/python",
        },
      },
      on_attach = function(client, bufnr)
        -- Disable overlapping features
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        client.server_capabilities.diagnosticProvider = false
        client.server_capabilities.hoverProvider = true
        client.server_capabilities.codeActionProvider = false
        -- Keep definition
        client.server_capabilities.definitionProvider = true
      end,
    })

    -- CMP setup
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })

    -- Diagnostic config
    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Map Ctrl-] to LSP definition (global)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, { desc = "Go to definition" })
  end,
}
