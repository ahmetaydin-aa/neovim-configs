return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    debug = false,
    model = 'claude-sonnet-4',
    temperature = 0.1,
    question_header = '## User ',
    answer_header = '## Copilot ',
    error_header = '## Error ',
    window = {
      layout = 'vertical',
      width = 0.2,
      height = 0.5,
      relative = 'editor',
    },
    selection = function(source)
      local select = require('CopilotChat.select')
      return select.visual(source) or select.buffer(source)
    end,
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    chat.setup(opts)

    -- Keymaps
    vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<cr>', { desc = '[C]opilot [C]hat Toggle' })
    vim.keymap.set('v', '<leader>cc', '<cmd>CopilotChatToggle<cr>', { desc = '[C]opilot [C]hat Toggle' })
    vim.keymap.set('n', '<leader>cx', '<cmd>CopilotChatReset<cr>', { desc = '[C]opilot Chat Reset' })
    vim.keymap.set('n', '<leader>cq', function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end, { desc = '[C]opilot [Q]uick Chat' })

    -- Quick actions
    vim.keymap.set('v', '<leader>ce', '<cmd>CopilotChatExplain<cr>', { desc = '[C]opilot [E]xplain' })
    vim.keymap.set('v', '<leader>ct', '<cmd>CopilotChatTests<cr>', { desc = '[C]opilot Generate [T]ests' })
    vim.keymap.set('v', '<leader>cr', '<cmd>CopilotChatReview<cr>', { desc = '[C]opilot [R]eview' })
    vim.keymap.set('v', '<leader>cf', '<cmd>CopilotChatFix<cr>', { desc = '[C]opilot [F]ix' })
    vim.keymap.set('v', '<leader>co', '<cmd>CopilotChatOptimize<cr>', { desc = '[C]opilot [O]ptimize' })
    vim.keymap.set('v', '<leader>cd', '<cmd>CopilotChatDocs<cr>', { desc = '[C]opilot [D]ocs' })
  end,
}
