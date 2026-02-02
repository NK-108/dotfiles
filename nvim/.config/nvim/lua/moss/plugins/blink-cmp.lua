return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    keymap = {
      preset = "none",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-h>"] = { "hide", "fallback" },
      ["<C-space>"] = { "select_and_accept", "fallback" },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    completion = {
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
        },
        border = "single",
        winblend = 0, -- Controls transparency (0 is opaque, 100 transparent)
      },

      documentation = {
        auto_show = false,
        window = {
          border = "single",
        },
      },

      keyword = { range = "full" },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      ghost_text = {
        enabled = false,
      },
      accept = { auto_brackets = { enabled = false } },
    },
    signature = {
      enabled = true,
      window = {
        border = "single",
      }
    },

    -- Add "buffer" to enable text completions
    sources = {
      default = { "lsp", "path", "snippets" },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
