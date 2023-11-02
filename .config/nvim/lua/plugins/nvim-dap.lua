local dap = require("dap")
local port = "265242"

require("dapui").setup()
require("mason").setup()
-- dap.setup()
-- require("mason-nvim-dap").setup({automatic_setup = true})

-- Adapters
dap.adapters.codelldb = {
    type = 'server',
    port = port,
    executable = {
        command = '~/.local/share/nvim/mason/bin/codelldb',
        args = { "--port", port }
    }
}
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}

-- Configurations
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}
    }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.set_log_level("TRACE")
