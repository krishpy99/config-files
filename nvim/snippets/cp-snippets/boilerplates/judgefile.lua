local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tjudge", snippetType = "autosnippet"}, {
    t("
#ifndef ONLINE_JUDGE
	freopen(\"input.in\", \"r\", stdin);
	freopen(\"output.in\", \"w\", stdout);
#endif
"),
  }),
}
