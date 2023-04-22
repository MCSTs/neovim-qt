--> Debug

--> 1.C/C++/Rust
local dap = require('dap')
dap.adapters.codelldb = {
    type = 'server',
    -- port = "${port}",
    port = "13000",
    executable = {
        -- CHANGE THIS to your path!
        command = '/home/mcst/.local/share/nvim/mason/packages/codelldb',
        -- args = { "--port", "${port}" },
        args = { "--port", "13000" },

        -- On windows you may have to uncomment this:
        -- detached = false,
    }
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        -- name = "test",
        type = "codelldb",
        request = "launch",
        program = function()
            -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            return vim.fn.input('/home/mcst/.local/share/nvim/mason/packages/codelldb', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


--> Golang
-- require('dap-go').setup()
require('dap-go').setup {
    -- Additional dap configurations can be added.
    -- dap_configurations accepts a list of tables where each entry
    -- represents a dap configuration. For more details do:
    -- :help dap-configuration
    dap_configurations = {
        {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
    -- delve configurations
    delve = {
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}"
    },
}




--> Keymapping
vim.keymap.set("n", "<leader>db", ":FloatermNew! /home/mcst/.local/share/nvim/mason/bin/codelldb --port 13000 &<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")

vim.keymap.set("n", "<leader>dp", ":lua require'dap'.toggle_breakpoint()<CR>")

vim.keymap.set("n", "<leader>ds", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_out()<CR>")

--[[
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
--]]
