return {
  "Vonr/align.nvim",
  branch = "v2",
  lazy = true,
  keys = {
    {
      "<leader>ac",
      function() require("align").align_to_char({ length = 1, }) end,
      desc = "[A]lign to [C]har",
      mode = { "x" },
    },
    {
      "<leader>ad",
      function() require("align").align_to_char({ length = 2, }) end,
      desc = "[A]lign to [D]ouble Chars",
      mode = { "x" },
    },
    {
      "<leader>as",
      function() require("align").align_to_string({ preview = true, regex = false, }) end,
      desc = "[A]lign to [S]tring",
      mode = { "x" },
    },
    {
      "<leader>ar",
      function() require("align").align_to_string({ preview = true, regex = true, }) end,
      desc = "[A]lign to [R]egex",
      mode = { "x" },
    },
  }
}
