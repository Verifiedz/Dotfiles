local dap = require("dap")

-- 1. Setup the Adapter (NetCoreDbg)
dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/Wasim/.local/share/nvim/mason/bin/netcoredbg',
  args = {'--interpreter=vscode'}
}

-- 2. Setup the Configuration (C#)
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    
    -- SMART PROGRAM FINDER: Automatically points to your DLL
    program = function()
        -- Try to find the DLL automatically to save you typing
        local cwd = vim.fn.getcwd()
        local default_path = cwd .. '/ChatService/bin/Debug/net8.0/ChatService.dll'
        
        if vim.fn.filereadable(default_path) == 1 then
            return default_path
        else
            -- Fallback: If build failed or path is wrong, ask you
            return vim.fn.input('Path to dll: ', cwd .. '/ChatService/bin/Debug/net8.0/', 'file')
        end
    end,

    -- CRITICAL FIX: Run the app INSIDE the ChatService folder so it finds appsettings.json
    cwd = vim.fn.getcwd() .. "/ChatService",

    -- Force Port 5050
    env = {
      ASPNETCORE_ENVIRONMENT = "Development",
      ASPNETCORE_URLS = "http://localhost:5050" 
    },
  },
}
