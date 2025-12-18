return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {},
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          commented = false,
        },
      },
      -- {
      --   "igorlfs/nvim-dap-view",
      --   ---@module 'dap-view'
      --   ---@type dapview.Config
      --   opts = {},
      -- },
    },
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }

    dap.configurations.c = {
      {
        name = "Launch Current File",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.expand("%:p:r")
        end,
        args = function()
          return vim.fn.input("Arguments: ")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Launch File",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to exectuable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = function()
          return vim.fn.input("Arguments: ")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
          return vim.fn.input("Path to exectuable: ", vim.fn.getcwd() .. "/", "file")
        end,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        args = {},
        cwd = "${workspaceFolder}",
      },
    }
    dap.configurations.cpp = dap.configurations.c

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "[D]ebugger [B]reakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "[D]ebugger [C]ontinue",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "[D]ebugger [R]epl",
    },
    {
      "<Down>",
      function()
        require("dap").step_over()
      end,
      desc = "[D]ebugger [C]ontinue",
    },
    {
      "<Left>",
      function()
        require("dap").step_out()
      end,
      desc = "[D]ebugger [C]ontinue",
    },
    {
      "<Right>",
      function()
        require("dap").step_into()
      end,
      desc = "[D]ebugger [C]ontinue",
    },
    {
      "<Up>",
      function()
        require("dap").restart_frame()
      end,
      desc = "[D]ebugger [C]ontinue",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "[D]ebugger [U]i",
    },
    {
      "<leader>df",
      function()
        require("dapui").float_element()
      end,
      mode = { "n", "v" },
      desc = "[D]ebugger [F]loat",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      mode = { "n", "v" },
      desc = "[D]ebugger [E]val",
    },
    {
      "<leader>dq",
      function()
        require("dapui").close()
        -- require("dap-view").close()
        require("dap").terminate()
      end,
      desc = "[D]ebugger [Q]uit",
    },
    -- For Use with Dap-View Plugin
    -- {
    --   "<Leader>dw",
    --   function()
    --     require("dap-view").add_expr()
    --   end,
    --   desc = "[D]ebugger [W]atch",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>dv",
    --   "<Cmd>DapViewToggle<CR>",
    --   desc = "[D]ebugger [Q]uit",
    -- },
  },
}
