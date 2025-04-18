-- usamos intelephense como LSP principal
local servers = {}

-- intelephense: para todo excepto code actions
servers.intelephense = {
  settings = {
    intelephense = {
      environment = {
        includePaths = { "vendor", "app", "database" },
      },
      files = {
        maxSize = 5000000,
      },
      diagnostics = {
        undefinedTypes = true,
      },
      completion = {
        fullyQualifyGlobalConstantsAndFunctions = false,
      },
    },
  },
}

-- phpactor solo como proveedor de Code Actions
servers.phpactor = {
  on_attach = function(client, _)
    -- Desactiva todo excepto codeAction
    local disable = {
      "hoverProvider",
      "definitionProvider",
      "referencesProvider",
      "documentFormattingProvider",
      "documentRangeFormattingProvider",
      "renameProvider",
      "documentSymbolProvider",
      "semanticTokensProvider",
    }
    for _, capability in ipairs(disable) do
      if client.server_capabilities[capability] ~= nil then
        client.server_capabilities[capability] = false
      end
    end
    client.server_capabilities.completionProvider = nil
    client.server_capabilities.signatureHelpProvider = nil
  end,
}
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = servers,
  },
}
