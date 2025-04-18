return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      -- 🔧 PHP / Laravel
      "intelephense", -- LSP para PHP
      "phpstan", -- Análisis estático
      "pint", -- Formateador para Laravel
      "blade-formatter", -- Formateador de vistas Blade
      "php-debug-adapter", -- Debugging (Xdebug)
      "php-cs-fixer", -- Alternativa a Pint (muy útil)

      -- 🌐 Frontend (JS/TS/CSS/HTML)
      "prettierd", -- Formateador rápido
      "eslint_d", -- Linter súper rápido para JS
      "tailwindcss-language-server", -- LSP para Tailwind
      "html-lsp", -- HTML
      "css-lsp", -- CSS
      "emmet-ls", -- Soporte para Emmet
      "typescript-language-server", -- TS/JS
      "vue-language-server", --Vue languajeServer

      -- 🐚 Shell & DevOps
      "bash-language-server", -- Bash LSP
      "shellcheck", -- Linter de shell scripts
      "shfmt", -- Formateador de shell scripts
      "actionlint", -- GitHub Actions linter
      "dockerfile-language-server", -- Dockerfile LSP
      "docker-compose-language-service", -- docker-compose LSP
      "hadolint", -- Dockerfile linter
      "nginx-language-server", -- Para NGINX config files

      -- 🐍 Python (opcional si usas Python para scripts)
      "pyright", -- LSP
      "black", -- Formateador
      "flake8", -- Linter

      -- 🧠 Utilidades y otros
      "stylua", -- Formateador para Lua
      "lua-language-server", -- LSP para Lua
      "rustywind", -- Ordena clases de Tailwind automáticamente
    })
  end,
}
