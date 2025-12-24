return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      vim.keymap.set('n', '<leader><C-e>', ':Neotree toggle filesystem left<CR>', { desc = 'Neo-Tree: Toggle File [E]xplorer' })
    end
  }
}
