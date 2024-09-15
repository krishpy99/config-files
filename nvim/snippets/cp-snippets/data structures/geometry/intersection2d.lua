local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"t2dintersectionpoint", snippetType = "autosnippet"}, {
    t("
pt intersect(pt a, pt d1, pt b, pt d2) {
	return a1 + (b - a).cross(d2) / d1.cross(d2) * d1;
}
"),
  }),
}
