return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
     
    local ls = require("luasnip")

    -- Require and call the load function from your snippets/init.lua
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
    
    ls.config.set_config({
	    enable_autosnippets = true,
    })

    
    -- More configuration as needed...
  end,
}
