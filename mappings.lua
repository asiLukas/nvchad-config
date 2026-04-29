require "nvchad.mappings"

local map = vim.keymap.set

-- window splits
map("n", "|", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "-", "<cmd>split<CR>", { desc = "Horizontal Split" })

-- buffer navigation
map("n", "<S-l>", function() require("nvchad.tabufline").next() end, { desc = "Next Buffer" })
map("n", "<S-h>", function() require("nvchad.tabufline").prev() end, { desc = "Prev Buffer" })

-- session management
map("n", "<C-s>", "<cmd>SessionSave<CR>", { desc = "Save Session" })
map("n", "<C-f>", "<cmd>SessionSearch<CR>", { desc = "Search Session" })

-- neotest
map("n", "<leader>dm", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Test Method" })
map("n", "<leader>dM", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", { desc = "Test Method DAP" })
map("n", "<leader>df", "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<CR>", { desc = "Test Class" })
map("n", "<leader>dF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>",
  { desc = "Test Class DAP" })
map("n", "<leader>dS", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Test Summary" })

-- copilot
map("n", "<leader>ac", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Chat" })
map("n", "<leader>ae", "<cmd>CopilotChatExplain<CR>", { desc = "Explain Code" })
map("n", "<leader>at", "<cmd>CopilotChatTests<CR>", { desc = "Generate Tests" })
map("n", "<leader>ar", "<cmd>CopilotChatReview<CR>", { desc = "Review Code" })
map("n", "<leader>af", "<cmd>CopilotChatFix<CR>", { desc = "Fix Code" })
map("n", "<leader>ao", "<cmd>CopilotChatOptimize<CR>", { desc = "Optimize Code" })
map("n", "<leader>ad", "<cmd>CopilotChatDocs<CR>", { desc = "Add Documentation" })

-- lazygit, lazydocker
map({ "n", "t" }, "<leader>gg", function()
  require("nvchad.term").toggle({
    pos = "float",
    id = "lazygit",
    cmd = "exec lazygit",
    float_opts = {
      width = 1,
      height = 1,
    }
  })
end, { desc = "Lazygit" })

map({ "n", "t" }, "<leader>lg", function()
  require("nvchad.term").toggle({
    pos = "float",
    id = "lazydocker",
    cmd = "exec lazydocker",
    float_opts = {
      width = 0.9,
      height = 0.9,
    }
  })
end, { desc = "Lazydocker" })

-- auto close on exit
vim.api.nvim_create_autocmd("TermClose", {
  desc = "Close terminal buffer on process exit",
  callback = function(args)
    if vim.v.event.status == 0 then
      -- Check if the buffer still exists before trying to delete it
      if vim.api.nvim_buf_is_valid(args.buf) then
        vim.api.nvim_buf_delete(args.buf, { force = true })
      end
    end
  end,
})

-- file operations
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Window" })

-- nvim Tree (file explorer)
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- grep and stuff
map("n", "<leader>st", "<cmd>Telescope live_grep<CR>", { desc = "Search Text (Live Grep)" })
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search Files" })

-- git
map("n", "<leader>gl", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Git Blame Line" })

map("n", "<leader>tb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle Git Blame" })

-- diagnostic
map("n", "gl", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Show Diagnostic Error/Message" })
