local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tautolcm", snippetType = "autosnippet"}, {
    t("
auto lcm = [&](vector<int64_t> v) -> int64_t{
		int64_t ans = v[0];
		for (int i = 1; i < (int)v.size(); i++) {
			ans = (v[i] * ans) / __gcd(v[i], ans);
		}
		return ans;
	};
"),
  }),
}
