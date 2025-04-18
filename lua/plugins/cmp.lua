return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.window = {
      completion = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
      }),
      documentation = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:CmpDocBorder,CursorLine:PmenuSel,Search:None",
      }),
    }
    return opts
  end,
}
