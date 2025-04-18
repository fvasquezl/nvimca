return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vuels = {
        settings = {
          vetur = {
            validation = {
              template = true,
              style = true,
              script = true,
            },
          },
        },
      }, -- 👈 configuración por defecto para Vue LSP
    },
  },
}
