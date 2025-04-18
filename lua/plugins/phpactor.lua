local phpactor = function()
  vim.ui.select({
    "class_inflect",
    "context_menu",
    "expand_class",
    "generate_accessor",
    "change_visibility",
    "copy_class",
    "import_class",
    "import_missing_classes",
    "move_class",
    "navigate",
    "new_class",
    "transform",
    "update",
    "config",
    "status",
    "cache_clear",
  }, {
    prompt = "Phpactor Action",
  }, function(choice)
    if not choice or choice == "" then
      return
    end

    if choice == "new_class" then
      return vim.ui.input({
        prompt = "New Class Name (e.g. App\\Services\\MyService)",
      }, function(value)
        if not value or value == "" then
          return
        end
        require("phpactor").rpc("new_class", { class = value })
      end)
    else
      require("phpactor").rpc(choice, {})
    end
  end)
end

return {
  "adalessa/phpactor.nvim",
  cmd = { "PhpActor" },
  keys = {
    { "<leader>pa", phpactor, desc = "PhpActor: Action Menu" },
    {
      "<leader>pg",
      function()
        require("phpactor").rpc("generate_accessor", {})
      end,
      desc = "PhpActor: Generate Accessors",
    },
    {
      "<leader>pm",
      function()
        require("phpactor").rpc("move_class", {})
      end,
      desc = "PhpActor: Move Class",
    },
    {
      "<leader>pi",
      function()
        require("phpactor").rpc("import_missing_classes", {})
      end,
      desc = "PhpActor: Import Missing Classes",
    },
    {
      "<leader>pc",
      ":PhpActor context_menu<CR>",
      desc = "PhpActor: Context Menu",
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    install = {
      bin = "/usr/bin/phpactor", -- usa el binario global
    },
    lspconfig = {
      enabled = false, -- 👈 lo dejamos deshabilitado como LSP
    },
  },
  -- config = function()
  --   -- 👉 Agregamos code actions de Phpactor sobre <leader>ca para PHP
  --   vim.api.nvim_create_autocmd("FileType", {
  --     pattern = "php",
  --     callback = function()
  --       vim.keymap.set("n", "<leader>ca", function()
  --         require("phpactor").rpc("context_menu", {})
  --       end, { buffer = true, desc = "Phpactor: Code Actions (override)" })
  --     end,
  --   })
  -- end,
}
