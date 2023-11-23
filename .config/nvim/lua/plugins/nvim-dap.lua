local dap = require("dap")
local dapui = require("dapui")
local port = "265242"

dapui.setup()
-- dap.setup()
-- require("mason-nvim-dap").setup({
--     ensure_installed = { "codelldb" },
--     handlers = {
--         function(config)
--             require("mason-nvim-dap").default_setup(config)
--         end,
--         lldb = function(config)
--             config.adapters = {
--                 type = "executable",
--                 command = "/usr/bin/lldb-vscode",
--                 name = "lldb",
--             }
--             config.configurations = {
--                 name = "Launch file",
--                 type = "lldb",
--                 request = "launch",
--                 program = function()
--                     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--                 end,
--                 cwd = "${workspaceFolder}",
--                 stopOnEntry = false,
--                 args = function()
--                     local args_string = vim.fn.input("Arguments: ")
--                     return vim.split(args_string, " +")
--                 end,
--             }
--             config.filetypes = { "c", "cpp", "rust" }
--             require("mason-nvim-dap").default_setup(config)
--         end,
--         codelldb = function(config)
--             config.name = "codelldb"
--             config.adapters = {
--                 type = "server",
--                 port = "${port}",
--                 executable = {
--                     command = vim.fn.exepath("codelldb"),
--                     args = { "--port", "${port}" },
--                 },
--             }
--             config.configurations = {
--                 name = "LLDB: Launch",
--                 type = "codelldb",
--                 request = "launch",
--                 program = function()
--                     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--                 end,
--                 cwd = "${workspaceFolder}",
--                 stopOnEntry = false,
--                 args = function()
--                     local args_string = vim.fn.input("Arguments: ")
--                     return vim.split(args_string, " +")
--                 end,
--             }
--             config.filetypes = { "c", "cpp", "rust", "swift", "zig" }
--             require("mason-nvim-dap").default_setup(config)
--         end,
--     },
--     automatic_installation = false,
-- })

-- Adapters
dap.adapters.codelldb = {
    type = "server",
    port = port,
    executable = {
        command = "~/.local/share/nvim/mason/bin/codelldb",
        args = { "--port", port },
    },
}
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
    name = "lldb",
}

-- Configurations
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
        end,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.set_log_level("TRACE")

local function undo_dap_bindings()
    dapui.close()
    -- vim.keymap.del("n", "<F5>")
    -- vim.keymap.del("n", "<F10>")
    -- vim.keymap.del("n", "<F11>")
    -- vim.keymap.del("n", "<F12>")
end

-- Keymaps and Dapui mapped to DAP Events
dap.listeners.after.event_initialized["dapui_config"] = function()
    local default_opts = { noremap = true, silent = true }
    dapui.open()
    vim.keymap.set("n", "<F5>", function()
        dap.continue()
    end, default_opts)
    vim.keymap.set("n", "<F10>", function()
        dap.step_over()
    end, default_opts)
    vim.keymap.set("n", "<F11>", function()
        dap.step_into()
    end, default_opts)
    vim.keymap.set("n", "<F12>", function()
        dap.step_out()
    end, default_opts)
end

dap.listeners.before.event_terminated["dapui_config"] = undo_dap_bindings

dap.listeners.before.event_exited["dapui_config"] = undo_dap_bindings
