-- Customize None-ls sources
-- Docs: https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- ── Formatting ──────────────────────────────────────────────────────
      -- prettierd: daemon version of Prettier (much faster on repeated saves)
      null_ls.builtins.formatting.prettierd.with {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "jsonc",
          "yaml",
          "markdown",
          "mdx",
        },
      },

      -- ── Diagnostics ─────────────────────────────────────────────────────
      -- eslint_d: daemon version of ESLint (significantly faster than eslint LSP)
      require("none-ls.diagnostics.eslint_d").with {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      },

      -- stylelint: CSS / SCSS / Less linter
      null_ls.builtins.diagnostics.stylelint.with {
        filetypes = { "css", "scss", "less", "sass" },
      },

      -- ── Code Actions ────────────────────────────────────────────────────
      -- eslint_d code actions (auto-fix, disable-rule comments, etc.)
      require("none-ls.code_actions.eslint_d").with {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      },
    })
  end,
}
