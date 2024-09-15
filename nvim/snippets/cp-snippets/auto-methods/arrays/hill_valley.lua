local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"thillvalley", snippetType = "autosnippet"}, {
    t("
vector<int64_t> hill, valley;
auto hill_valley = [&] (vector<int64_t> v) {
	if (n > 1) {
		if (v[0] < v[1])valley.push_back(0);
		if (v[n - 1] < v[n - 2])valley.push_back(n - 1);
		if (v[n - 1] > v[n - 2])hill.push_back(n - 1);
		if (v[1] < v[0])hill.push_back(0);
	}
	for (int i = 1; i < n - 1; i++) {
		if (v[i] < v[i - 1] && v[i] < v[i + 1])valley.push_back(i);
		else if (v[i] > v[i - 1] && v[i] > v[i + 1])hill.push_back(i);
	}
};
"),
  }),
}
