local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"theader", snippetType = "autosnippet"}, {
    t("
/*
	Author : yk_2310/theLastAckerman 
	Date   : 
	Time   : 
*/
"),
  }),
}
