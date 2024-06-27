return {
  {
    -- Plugin simplifies the process of installation and management of language servers
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    --Pluging bridges "mason.nvim" and "nvim-lspconfig". It ensures that the language servers installed 
    -- via the "mason.nvim" are automatically configured with "nvim-lspconfig"
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- lua, C and C++ and Bash configuration
        ensure_installed = { "lua_ls", "clangd" }
      })
    end
  },
  {
    -- Plugin provides easy configuration process for different languages
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      --Key Mappings   
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- set shift-K for displaying docs     
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- set gd for go to definition
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {}) -- set \ca for actions
    end
  }
}
