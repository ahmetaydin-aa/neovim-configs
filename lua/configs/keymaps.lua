vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- For Claude Code
vim.keymap.set("n", "<leader>ai", function()
	vim.cmd("botright split")
	vim.cmd("resize 20")
	vim.cmd("terminal claude")
end, { desc = "Open: [C][l]aude [C]ode" })
