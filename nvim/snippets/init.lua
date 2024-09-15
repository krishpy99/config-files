local M = {}

M.load = function()
  require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath("config") .. "/snippets/cp-snippets"})
end

return M
