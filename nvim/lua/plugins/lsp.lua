return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",  -- C++
          "pyright", -- Python
	  "rust_analyzer",
	  "ts_ls",
	  "jdtls",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- go to definition
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- hover docs
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- rename symbol
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- code actions
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts) -- show error detail
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)         -- previous error
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- next error
      end

      vim.diagnostic.config({
        virtual_text = true,      -- show error message inline at end of line
        signs = true,             -- show icons in the sign column on the left
        underline = true,         -- underline the problematic code
        update_in_insert = false, -- don't show errors while actively typing
        severity_sort = true,     -- errors before warnings
      })

      vim.lsp.config("clangd", { on_attach = on_attach, capabilities = require("cmp_nvim_lsp").default_capabilities(), })
      vim.lsp.config("pyright", { on_attach = on_attach, capabilities = require("cmp_nvim_lsp").default_capabilities(), })
      vim.lsp.config("rust_analyzer", { on_attach = on_attach, capabilities = require("cmp_nvim_lsp").default_capabilities(), })
      vim.lsp.config("ts_ls", { on_attach = on_attach, capabilities = require("cmp_nvim_lsp").default_capabilities(), })
      vim.lsp.config("jdtls", { on_attach = on_attach, capabilities = require("cmp_nvim_lsp").default_capabilities(), })
      
    end,
  },
}
