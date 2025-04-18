return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "V13Axel/neotest-pest",
    "olimorris/neotest-phpunit",
  },
  opts = function()
    return {
      adapters = {
        require("neotest-pest")({
          -- Puedes personalizar el comando si lo deseas
          -- command = "./vendor/bin/pest"
        }),
        require("neotest-phpunit")({
          -- También puedes personalizar este comando
          -- command = "./vendor/bin/phpunit"
        }),
      },
    }
  end,
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run()
      end,
      desc = "Run nearest test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run all tests in file",
    },
    {
      "<leader>ta",
      function()
        require("neotest").run.run({ suite = true })
      end,
      desc = "Run entire test suite",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Open test output",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle test summary",
    },
    {
      "<leader>tx",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop test run",
    },
  },
}
