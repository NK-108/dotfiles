return {
  "ingur/floatty.nvim",
  config = function()
    local term = require("floatty").setup({
      window = {
        border = "single",
      },
    })

    local layout = "horizontal"
    term.toggle_layout = function()
      layout = layout == "horizontal" and "vertical" or "horizontal"
      if layout == "horizontal" then
        term.window = {
          row = function()
            return vim.o.lines - 11
          end,
          width = 1.0,
          height = 0.40,
          h_align = "center",
          border = "single",
        }
      else
        term.window = {
          row = nil,
          height = function()
            return vim.o.lines - 3
          end,
          width = 0.40,
          h_align = "right",
          v_align = "top",
          border = "single",
        }
      end
    end

    vim.keymap.set("n", "<C-/>", function()
      term.toggle()
    end)
    vim.keymap.set("t", "<C-/>", function()
      term.toggle()
    end)
    vim.keymap.set("n", "<C-_>", function()
      term.toggle()
    end)
    vim.keymap.set("t", "<C-_>", function()
      term.toggle()
    end)
    vim.keymap.set("n", "<leader>tt", term.toggle_layout)
  end,
}
