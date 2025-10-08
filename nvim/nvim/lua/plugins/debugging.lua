
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- ======================
    -- Setup dap-ui with layout
    -- ======================
    dapui.setup({
      layouts = {
        {
          elements = {
            "scopes",
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,
          position = "right",
        },
        {
          elements = { "repl" },
          size = 10,
          position = "bottom",
        },
      },
    })

    -- Auto open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- ======================
    -- Rust / codelldb
    -- ======================
    dap.adapters.codelldb = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- Mason path
    }

    dap.configurations.rust = {
      {
        name = "Launch Rust program",
        type = "codelldb",
        request = "launch",
        program = function()
          -- auto-select binary in target/debug/<project_name>
          local cwd = vim.fn.getcwd()
          local binary = cwd .. "/target/debug/" .. vim.fn.fnamemodify(cwd, ":t")
          return binary
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    -- ======================
    -- Keymaps
    -- ======================
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    vim.keymap.set("n", "<Leader>dq", dap.terminate, {})   -- fixed exit
    vim.keymap.set("n", "<Leader>dr", dap.restart, {})     -- restart debug
  end,
}
