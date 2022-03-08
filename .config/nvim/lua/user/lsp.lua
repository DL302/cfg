local lsp_installer = require("nvim-lsp-installer")
vim.g.coq_settings = { auto_start = 'shut-up' }
local coq = require("coq")
-- Include the servers you want to have installed by default below
local servers = {
    "bashls",
    "pyright",
--    "ccls",
    "tsserver",
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print("Installing " .. name)
        server:install()
    end
end

lsp_installer.on_server_ready(function(server)
    -- Specify the default options which we'll use to setup all servers
    local opts = {
        on_attach = on_attach,
    }

    server:setup(coq.lsp_ensure_capabilities(opts))
end)
