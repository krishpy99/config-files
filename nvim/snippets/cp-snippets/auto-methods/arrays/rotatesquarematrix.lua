local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"trotatesquarematrix", snippetType = "autosnippet"}, {
    t("
auto rotate = [&](vector<vector<int>> &v, bool clockwise) {
	int N = v.size();
	assert((int)v[0].size() == N);
	for (int i = 0; i < N / 2; i++) {
		for (int j = i; j < N - i - 1; j++) {
			if (!clockwise) {
				int tem = v[i][j]; v[i][j] = v[j][N - i - 1];
				v[j][N - i - 1] = v[N - i - 1][N - j - 1];
				v[N - i - 1][N - j - 1] = v[N - j - 1][i];
				v[N - j - 1][i] = tem;

			} else {
				int tem = v[i][j]; v[i][j] = v[N - j - 1][i];
				v[N - j - 1][i] = v[N - i - 1][N - j - 1];
				v[N - i - 1][N - j - 1] = v[j][N - i - 1];
				v[j][N - i - 1] = tem;
			}
		}
	}
};
"),
  }),
}
