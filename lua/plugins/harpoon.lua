local function toggle_file(file_list)
  local current_file = vim.fn.expand("%")
  for _, value in ipairs(file_list.items) do
    if value.value == current_file then
      file_list:remove()
      return
    end
  end
  file_list:add()
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function() toggle_file(harpoon:list()) end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-A-p>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-A-n>", function() harpoon:list():next() end)
    end
  }
}
