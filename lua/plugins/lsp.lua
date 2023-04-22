--> Language Server Protocal

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
  },
})

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = "", Warn = "", Hint = "ﴞ", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
})

--> Python
-- require("lspconfig").pyright.setup {
--   capabilities = capabilities,
-- }
require("lspconfig").pylsp.setup({
  capabilities = capabilities,
})

--> C/C++
require("lspconfig").clangd.setup({
  capabilities = capabilities,
})

-->golang
-- require'lspconfig'.golangci_lint_ls.setup{}
require("lspconfig").gopls.setup({
  capabilities = capabilities,
})

--> offical
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>le", vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set("n", "<space>lf", function()
  vim.lsp.buf.format({ async = true })
end, bufopts)
