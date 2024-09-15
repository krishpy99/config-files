local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tconvex_polygon", snippetType = "autosnippet"}, {
    t("
struct convex_polygon {
	int n;
	vector <pt> points;
	convex_polygon(vector<pt> points) : n((int)points.size()), points(points) {}
	convex_polygon(vector<pair<double, double>> pointsxy) : n((int)pointsxy.size()) {
		points = vector<pt>(n);
		for (int i = 0; i < n; i++) {
			points[i].x = pointsxy[i].first;
			points[i].y = pointsxy[i].second;
		}
	}

	double area() {
		cout << \"Warning! points should be arranged in order!\n\";
		double ar = 0; int j = n - 1;
		for (int i = 0; i < n; i++) {
			ar += (points[i].x + points[j].x) * (points[j].y - points[i].y); j = i;
		}
		ar = abs(ar); ar /= 2.0; return ar;
	}
};
"),
  }),
}
