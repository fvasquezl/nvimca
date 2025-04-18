return {
  -- Phpactor como herramienta externa (no como LSP)
  "adalessa/phpactor.nvim",
  cmd = { "PhpActor" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>pa",
      function()
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        -- local actions = require("telescope.actions")
        -- local action_state = require("telescope.actions.state")

        local phpactor_actions = {
          "import_class",
          "import_missing_classes",
          "generate_accessor",
          "move_class",
          "new_class",
          "copy_class",
          "change_visibility",
          "class_inflect",
          "transform",
          "navigate",
          "expand_class",
          "context_menu",
          "status",
          "cache_clear",
          "config",
        }

        pickers
          .new({}, {
            prompt_title = "Phpactor Actions",
            finder = finders.new_table({
              results = phpactor_actions,
            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, map)
              local actions = require("telescope.actions")
              local action_state = require("telescope.actions.state")
              map("i", "<CR>", function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                -- Si es "new_class", pedimos el nombre
                if selection.value == "new_class" then
                  vim.ui.input({
                    prompt = "New Class Name (e.g. App\\Services\\MyService)",
                  }, function(value)
                    if value and value ~= "" then
                      require("phpactor").rpc("new_class", { class = value })
                    end
                  end)
                else
                  require("phpactor").rpc(selection.value, {})
                end
              end)
              return true
            end,
          })
          :find()
      end,
      desc = "Phpactor: Action Menu (Telescope)",
    },
    {
      "<leader>pi",
      function()
        require("phpactor").rpc("import_missing_classes", {})
      end,
      desc = "Phpactor: Import Missing Classes",
    },
    {
      "<leader>pg",
      function()
        require("phpactor").rpc("generate_accessor", {})
      end,
      desc = "Phpactor: Generate Accessors",
    },
    {
      "<leader>pm",
      function()
        require("phpactor").rpc("move_class", {})
      end,
      desc = "Phpactor: Move Class",
    },
    {
      "<leader>pc",
      ":PhpActor context_menu<CR>",
      desc = "Phpactor: Context Menu",
    },
  },
  opts = {
    install = {
      bin = "/usr/bin/phpactor", -- puedes ajustar si usas otra ruta
    },
    lspconfig = {
      enabled = false, -- 🔒 no usamos phpactor como LSP
    },
  },
}
