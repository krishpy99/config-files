local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tcircleboiler", snippetType = "autosnippet"}, {
    t("
struct Circle {
	pt c; double r;
	Circle() {}
	Circle
};
"),
  }),
}
