vim.env.PATH = "/opt/homebrew/opt/node@22/bin:" .. vim.env.PATH
return {
  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },

  { "ChristianChiarulli/swenv.nvim", ft = "python" },
  { "stevearc/dressing.nvim",        event = "VeryLazy" },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio", "nvim-neotest/neotest-python", "nvim-lua/plenary.nvim" },
    keys = { "<leader>dm", "<leader>df", "<leader>dS" },
    config = function()
      require("neotest").setup({
        adapters = { require("neotest-python")({ runner = "pytest" }) }
      })
    end
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "VeryLazy",
  --   config = function()
  --     require("copilot").setup({
  --       panel = { enabled = false },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         keymap = {
  --           accept = "<C-l>",
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>"
  --         },
  --       },
  --       filetypes = {
  --         yaml = true,
  --         markdown = true,
  --         help = false,
  --         gitcommit = false,
  --         gitrebase = false,
  --         hgcommit = false,
  --         svn = false,
  --         cvs = false,
  --         ["."] = false,
  --         ["*"] = true,
  --       },
  --     })
  --   end,
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = { { "zbirenbaum/copilot.lua" }, { "nvim-lua/plenary.nvim" } },
    cmd = { "CopilotChatToggle", "CopilotChatExplain", "CopilotChatTests" },
    opts = { window = { layout = 'vertical', width = 0.4 } },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright", "clangd", "omnisharp",
        "black", "isort", "prettier", "clang-format", "shellcheck"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash", "c", "javascript", "json", "lua", "python",
        "typescript", "tsx", "css", "rust", "java", "yaml", "cmake"
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "FormatDisable", "FormatEnable" },
    config = function()
      require "configs.conform"
    end,
  },
  -- Avante AI Chat Plugin
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "claude",
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
