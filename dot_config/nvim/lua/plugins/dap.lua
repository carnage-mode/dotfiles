return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    local dap, dapui = require "dap", require "dapui"

    dapui.setup()

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "OpenDebugAD7",
    }

    dap.configurations.c = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = function()
          local function split(str, delimiter)
            local result = {}
            for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
              table.insert(result, match)
            end
            return result
          end

          local str = vim.fn.input "Arguments: "
          local delimiter = " "

          return split(str, delimiter)
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      },
      {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
      },
    }

    vim.keymap.set("n", "<Leader>tb", function()
      dap.toggle_breakpoint()
    end, { desc = "Break Point" })

    vim.keymap.set("n", "<Leader>dc", function()
      dap.continue()
    end, { desc = "Continue" })

    vim.keymap.set("n", "<Leader>dx", function()
      dap.run_to_cursor()
    end, { desc = "Run Upto Cursor" })

    vim.keymap.set("n", "<Leader>di", function()
      dap.step_into()
    end, { desc = "Step Into" })

    vim.keymap.set("n", "<Leader>dv", function()
      dap.step_over()
    end, { desc = "Step Over" })

    vim.keymap.set("n", "<Leader>du", function()
      dap.step_out()
    end, { desc = "Step Out" })

    vim.keymap.set("n", "<Leader>db", function()
      dap.step_back()
    end, { desc = "Step Back" })

    vim.keymap.set("n", "<Leader>dr", function()
      dap.restart()
    end, { desc = "Restart" })

    vim.keymap.set("n", "<Leader>dt", function()
      dap.terminate()
    end, { desc = "Terminate" })

    vim.keymap.set("n", "<Leader>td", function()
      dapui.toggle()
    end, { desc = "Debug UI" })

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
}
