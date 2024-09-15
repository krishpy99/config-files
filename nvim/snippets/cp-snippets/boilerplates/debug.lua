local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tdebug", snippetType = "autosnippet"}, {
    t("
template<typename... T>
void deb(T... args) {
	((cout << args << ' '), ...); cout << '\n';
}
"),
  }),
}
