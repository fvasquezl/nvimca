return {

  --
  -- :MasonInstall intelephense
  -- checkhealth nvim-treesitter
  --
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv", -- Para leer variables de entorno desde .env
      "nvim-telescope/telescope.nvim", -- Para comandos como Telescope
      "MunifTanjim/nui.nvim", -- Para interfaces de usuario
      "nvim-lua/plenary.nvim", -- Dependencia común para muchos plugins
      "kevinhwang91/promise-async", -- Para configurar LSP
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Run Artisan commands" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "List Laravel routes" },
      { "<leader>lm", ":Laravel related<cr>", desc = "Show related Laravel items" },
    },
    event = { "VeryLazy" }, -- Carga el plugin de forma diferida
    config = function()
      require("laravel").setup({
        lsp_server = "phpactor", -- Usa Intelephense como LSP
        features = {
          route_info = {
            enable = true,
            view = "top", -- Muestra la información de rutas en la parte superior
          },
          model_info = {
            enable = true, -- Habilita la información de modelos
          },
          override = {
            enable = true, -- Habilita la funcionalidad de override
          },
          pickers = {
            enable = true,
            provider = "telescope", -- Usa Telescope como proveedor para pickers
          },
        },
        ui = require("laravel.options.ui"), -- Configuración de UI por defecto
        commands_options = require("laravel.options.command_options"), -- Opciones para comandos
        environments = require("laravel.options.environments"), -- Configuración de entornos
        user_commands = require("laravel.options.user_commands"), -- Comandos personalizados
        resources = require("laravel.options.resources"), -- Recursos disponibles
        providers = {
          require("laravel.providers.laravel_provider"),
          require("laravel.providers.repositories_provider"),
          require("laravel.providers.override_provider"),
          require("laravel.providers.completion_provider"),
          require("laravel.providers.route_info_provider"),
          require("laravel.providers.tinker_provider"),
          require("laravel.providers.telescope_provider"),
          require("laravel.providers.fzf_lua_provider"),
          require("laravel.providers.ui_select_provider"),
          require("laravel.providers.user_command_provider"),
          require("laravel.providers.status_provider"),
          require("laravel.providers.diagnostics_provider"),
          require("laravel.providers.model_info_provider"),
          require("laravel.providers.composer_info_provider"),
          require("laravel.providers.history_provider"),
        },
        user_providers = {}, -- Proveedores personalizados (vacío por ahora)
      })
    end,
  },
}
