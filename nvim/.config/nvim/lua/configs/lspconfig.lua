local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- HTML/CSS Setup
lspconfig.html.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}

-- The New C# Setup (csharp_ls)
-- automatic, simple, no complex arguments needed
lspconfig.csharp_ls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}
