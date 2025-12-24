return {
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: [F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: [F]ind with [G]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: [F]ind in [B]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: [H]elp tags' })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            })
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
