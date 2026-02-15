return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "clangd",
          "cssls",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "nixd",
          "pyright",
          "rust_analyzer",
          "taplo",
          "tsserver",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_text = { spacing = 4, prefix = "●" },
        float = { border = "rounded" },
      })

      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gr", vim.lsp.buf.references, "Go to references")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>f", function()
          vim.lsp.buf.format({ async = false })
        end, "Format buffer")

        if vim.lsp.inlay_hint then
          pcall(function()
            if vim.lsp.inlay_hint.enable then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            else
              vim.lsp.inlay_hint(bufnr, true)
            end
          end)
        end

        if client.server_capabilities.documentFormattingProvider then
          local group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })
          vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end

      local servers = {
        bashls = {},
        clangd = {},
        cssls = {},
        html = {},
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
        marksman = {},
        nixd = {},
        pyright = {},
        rust_analyzer = {},
        taplo = {},
        tsserver = {},
        yamlls = {},
      }

      for server, config in pairs(servers) do
        lspconfig[server].setup(vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, config))
      end
    end,
  },
}
