return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim"
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- formattings
          null_ls.builtins.formatting.stylua,             -- For Lua formatting
          null_ls.builtins.formatting.black,              -- For python formatting
          null_ls.builtins.formatting.isort,              -- For python import formatting
          null_ls.builtins.formatting.google_java_format, -- For java formatting
          null_ls.builtins.formatting.prettier,           -- Prettier, you know this...
          null_ls.builtins.formatting.scalafmt,           -- For scala
          null_ls.builtins.formatting.sqlfmt,             -- For SQL (need to install `sqlfmt` first)
          -- code actions
          null_ls.builtins.code_actions.gitsigns,         -- For Git operations at the current cursor position (stage / preview / reset hunks, blame, etc.)
          -- completions
          -- null_ls.builtins.completion.spell,              -- For Spell suggestions (removed for messing with autocompletion)
          null_ls.builtins.completion.tags,               -- For tag autocompletion
          -- diagnostics
          null_ls.builtins.diagnostics.hadolint,          -- For Docker files
          null_ls.builtins.diagnostics.markdownlint,      -- For Markdown files
          -- null_ls.builtins.diagnostics.checkstyle.with({
          --   extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
          -- }),                                         -- For Java files (must install `checkstyle` first)
          null_ls.builtins.diagnostics.pylint,    -- For python
          null_ls.builtins.diagnostics.spectral,  -- For JSON/YAML files
          null_ls.builtins.diagnostics.stylelint, -- For style files like CSS, LESS etc.
          null_ls.builtins.diagnostics.vacuum,    -- For OpenAPI YAML/JSON files
          require("none-ls.diagnostics.eslint"),  -- requires none-ls-extras.nvim
        },
      })
    end,
  },
}
