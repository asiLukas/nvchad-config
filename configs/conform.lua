local options = {
  formatters_by_ft = {
    python = { "isort", "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    java = { "clang-format" },
    rust = { "rustfmt" },
  },

  formatters = {
    black = {
      prepend_args = { "--line-length=100" },
    },
    isort = {},
    prettier = {
      -- prepend_args = { "--single-quote", "--tab-width=4", "--print-width=88" },
    },
    ["clang-format"] = {
      prepend_args = { "--style=Google" },
    },
  },

  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
}

require("conform").setup(options)

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
