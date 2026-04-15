local nvlsp = require("nvchad.configs.lspconfig")

-- Load NvChad's default LSP settings (keymaps, capabilities)
pcall(nvlsp.defaults)

-- =========================================
-- 1. Pyright
-- =========================================
vim.lsp.config("pyright", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  -- In Neovim 0.11, root_dir is replaced by the much simpler 'root_markers'
  root_markers = { '.git', 'pyproject.toml', 'setup.py', 'requirements.txt', 'setup.cfg' },
})
vim.lsp.enable("pyright")

-- =========================================
-- 2. Clangd
-- =========================================
vim.lsp.config("clangd", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  init_options = {
    fallbackFlags = { '--std=c++20' }
  },
})
vim.lsp.enable("clangd")

-- =========================================
-- 3. Omnisharp
-- =========================================
vim.lsp.config("omnisharp", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = {
    "dotnet",
    vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll"
  },
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true,
    },
  },
})
vim.lsp.enable("omnisharp")

-- =========================================
-- 4. TypeScript / JavaScript (ts_ls)
-- =========================================
-- Note: 'tsserver' was officially renamed to 'ts_ls' in the Mason/Neovim ecosystem
vim.lsp.config("ts_ls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable("ts_ls")
