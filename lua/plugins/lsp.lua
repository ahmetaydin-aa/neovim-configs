return {
	{
		"neovim/nvim-lspconfig", -- For using LSP on Nvim
		dependencies = {
			"williamboman/mason.nvim", -- For installing LSPs
			"williamboman/mason-lspconfig.nvim", -- For connecting LSPs to Nvim
			"nvim-telescope/telescope.nvim", -- For showing things on telescope
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"pylsp",
					"jdtls",
				},
				automatic_installation = true,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			vim.lsp.config("jdtls", {
				settings = {
					java = {
						configuration = {
							-- IMPORTANT! Change these runtime configurations based on your JDK locations
							runtimes = {
								{
									name = "JavaSE-1.8",
									path = "/Users/ahaydin/Programs/1.8.312_Mac_m1",
									sources = "/Users/ahaydin/Programs/1.8.312_Mac_m1/lib/src.zip",
									javadoc = "https://docs.oracle.com/en/java/javase/8/docs/api",
								},
								{
									name = "JavaSE-11",
									path = "/Users/ahaydin/Programs/11.0.16.1_Mac_m1",
									sources = "/Users/ahaydin/Programs/11.0.16.1_Mac_m1/lib/src.zip",
									javadoc = "https://docs.oracle.com/en/java/javase/11/docs/api",
								},
								{
									name = "JavaSE-17",
									path = "/Users/ahaydin/Programs/17.0.4.Mac_m1",
									sources = "/Users/ahaydin/Programs/17.0.4.Mac_m1/lib/src.zip",
									javadoc = "https://docs.oracle.com/en/java/javase/17/docs/api",
									default = true,
								},
								{
									name = "JavaSE-21",
									path = "/Users/ahaydin/Programs/21.0.3.Mac_m1",
									sources = "/Users/ahaydin/Programs/21.0.3.Mac_m1/lib/src.zip",
									javadoc = "https://docs.oracle.com/en/java/javase/21/docs/api",
								},
							},
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local telescope = require("telescope.builtin")

					-- Configure diagnostics for capabilities like inline warning/error/info virtual text etc.
					vim.diagnostic.config({
						virtual_text = true,
						virtual_lines = false,
						signs = true,
						underline = true,
						update_in_insert = false,
						severity_sort = true,
					})

					local function getOpts(desc)
						return {
							buffer = ev.buf,
							desc = "LSP: " .. desc,
						}
					end

					vim.keymap.set("n", "K", vim.lsp.buf.hover, getOpts("Hover Documentation"))
					vim.keymap.set("n", "gd", telescope.lsp_definitions, getOpts("[G]oto [D]efinition"))
					vim.keymap.set("n", "gi", telescope.lsp_implementations, getOpts("[G]oto [I]mplementation"))
					vim.keymap.set("n", "gr", telescope.lsp_references, getOpts("[G]oto [R]eferences"))
					vim.keymap.set("n", "gt", telescope.lsp_type_definitions, getOpts("[G]oto [T]ype Definition"))
					vim.keymap.set("n", "<leader>ds", function()
						telescope.lsp_document_symbols({
							show_line = true,
						})
					end, getOpts("[D]ocument [S]ymbols"))
					vim.keymap.set("n", "<leader>ws", function()
						telescope.lsp_dynamic_workspace_symbols({
							show_line = true,
						})
					end, getOpts("[W]orkspace [S]ymbols"))
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, getOpts("[R]e[n]ame"))
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, getOpts("[C]ode [A]ction"))
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, getOpts("[F]ormat Code"))

					-- Diagnostics shortcuts
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, getOpts("[D]iagnostics Goto Previous Issue"))
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, getOpts("[D]iagnostics Goto Next Issue"))
					vim.keymap.set("n", "<leader>dt", function()
						local current = vim.diagnostic.config()

						vim.diagnostic.config({
							virtual_text = not current.virtual_text,
						})
					end, getOpts("[D]iagnostics [T]oggle Virtual Text"))
				end,
			})
		end,
	},
}
