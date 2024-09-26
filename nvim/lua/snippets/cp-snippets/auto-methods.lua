local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local gcdxy =
s("cpgcdxy", {
        t([[
// GCD of two numbers : ax + by = gcd(a,b). Finding x & y.

int64_t gcdxy(int64_t a, int64_t b, int64_t& x, int64_t& y) {
    if (b == 0) {
        x = 1;
        y = 0;
        return a;
    }
    int64_t x1, y1;
    int64_t d = gcdxy(b, a % b, x1, y1);
    x = y1;
    y = x1 - y1 * (a / b);
    return d;
}
]]),
})

local isprime =
s("cpisprime", {
        t([[
bool isPrime(int x) {
    for (int d = 2; d * d <= x; d++) {
        if (x % d == 0)
            return false;
    }
    return true;
}
]]),
})

local lcm =
s("autolcm", {
        t([[
auto lcm = [&](vector<int64_t> v) -> int64_t{
		int64_t ans = v[0];
		for (int i = 1; i < (int)v.size(); i++) {
			ans = (v[i] * ans) / __gcd(v[i], ans);
		}
		return ans;
	};
]]),
})

local arraybfs2D =
s("arraybfs2D", {
        t([[
auto arraybfs2D = [&](vector<pair<int, int>> sources, vector<vector<int>> v) -> vector<vector<int>> {
	int n = v.size(), m = v[0].size(); deque<vector<int>> d;
	vector<vector<int>> lvl(n, vector<int>(m, -1)), vis(n, vector<int>(m, 0));
	for (auto [i, j] : sources) {
		vis[i][j] = 1; d.push_back({i, j, 0});
	}
	auto check = [&](int i, int j) -> bool{
		if (i < n && j < m && i >= 0 && j >= 0 && !vis[i][j])return true;
		return false;
	};
	while (d.size() > 0) {
		int i = d.front()[0], j = d.front()[1], l = d.front()[2]; 
		lvl[i][j] = l; d.pop_front();
		if (check(i + 1, j))vis[i + 1][j] = 1, d.push_back({i + 1, j, l + 1});
		if (check(i, j + 1))vis[i][j + 1] = 1, d.push_back({i, j + 1, l + 1});
		if (check(i - 1, j))vis[i - 1][j] = 1, d.push_back({i - 1, j, l + 1});
		if (check(i, j - 1))vis[i][j - 1] = 1, d.push_back({i, j - 1, l + 1});
	}
	return lvl;
};
]]),
})

local arraydfs2D =
s("arraydfs2D", {
        t([[
auto arraydfs2D = [&](vector<vector<int>> v) -> void{
	int n = v.size(), m = v[0].size();
	vector<vector<int>> vis(n, vector<int>(m, 0));
	vector<vector<int>> lvl(n, vector<int>(m, 0));
	auto dfs = [&](int x, int y, int level, const auto & self) -> void {
		if (x >= n || x < 0 || y >= m || y < 0)return;
		if (vis[x][y]) {lvl[x][y] = min(level, lvl[x][y]); return;}
		vis[x][y] = 1; lvl[x][y] = level;
		self(x + 1, y, level + 1, self);
		self(x - 1, y, level + 1, self);
		self(x, y + 1, level + 1, self);
		self(x, y - 1, level + 1, self);
	};
	dfs(0, 0, 0, dfs);
};
]]),
})

local arraydfs3D =
s("arraydfs3D", {
        t([[
auto arraydfs3D = [&](vector<vector<vector<int>>> v) -> void{
	int n = v.size(), m = v[0].size(), o = v[0][0].size();
	vector<vector<vector<int>>> vis(n, vector<vector<int>>(m, vector<int>(o, 0)));
	vector<vector<vector<int>>> lvl(n, vector<vector<int>>(m, vector<int>(o, 0)));
	auto dfs = [&](int x, int y, int z, int level, const auto & self) -> void {
		if (x >= n || x < 0 || y >= m || y < 0 || z >= o || z < 0)return;
		if (vis[x][y][z]) {lvl[x][y][z] = min(level, lvl[x][y][z]); return;}
		vis[x][y][z] = 1; lvl[x][y][z] = level;
		self(x + 1, y, z, level + 1, self);
		self(x - 1, y, z, level + 1, self);
		self(x, y + 1, z, level + 1, self);
		self(x, y - 1, z, level + 1, self);
		self(x, y, z + 1, level + 1, self);
		self(x, y, z - 1, level + 1, self);
	};
	dfs(0, 0, 0, 0, dfs);
};
]]),
})

local hillvalley =
s("hillvalley", {
        t([[
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
]]),
})

local rotate_square_matrix =
s("cprotatesquarematrix", {
        t([[
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
]]),
})

local infix_postfix =
s("infixtopostfix", {
        t([[
int prec(char c) {
	if (c == '^')return 3;
	if (c == '*' || c == '/')return 2;
	if (c == '+' || c == '-')return 1;
	return -1;
}

string itop(string s) {
	stack<char> st; string result;
	for (int i = 0; i < (int)s.length(); i++) {
		char c = s[i];
		if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))
			result += c;
		else if (c == '(')
			st.push('(');
		else if (c == ')') {
			while (!st.empty() && st.top() != '(') {
				char temp = st.top();
				st.pop();
				result += temp;
			}
			st.pop();
		}
		else {
			while (!st.empty() && prec(s[i]) < prec(st.top())) {
				char temp = st.top();
				st.pop();
				result += temp;
			}
			st.push(c);
		}
	}
	while (!st.empty()) {
		char temp = st.top();
		st.pop();
		result += temp;
	}
	return result;
}
]]),
})

local minimum_swaps =
s("minimumswaps", {
        t([=[
auto minswaps = [&](string x, string y) -> int64_t {
		// make x from y
		vector<vector<int>> vx(256), vy(256);
		vector<int> cnt(256); int n = x.length();
		fenwick_tree<int> f(n);

		for (int i = 0; i < (int)x.length(); i++) {
			vx[x[i]].push_back(i);
			vy[y[i]].push_back(i);
		}

		int64_t ans = 0;
		for (int i = 0; i < (int)x.length(); i++) {
			int cur = vx[y[i]][cnt[y[i]]];
			int oldC = cur; cur += f.query(cur, n - 1);
			ans += cur - i; f.update(oldC, 1); cnt[y[i]]++;
		}
		return ans;
};
]=]),
})

local next_palindrome =
s("nextpalindrome", {
        t([[
string nextPalindrome(string s) {
	string res = s; int n = s.length();
	for (int i = 0; i < n; i++)
		res[n - 1 - i] = res[i];
	int f = 0;
	for (int i = 0; i < n; i++) {
		if (res[i] > s[i]) {f = 1; break;}
		else if (res[i] < s[i]) break;
	}
	if (f)return res;
	for (int i = (n - 1) / 2; i >= 0; i--) {
		if (res[i] == '9')res[i] = '0';
		else {res[i]++; f = 1; break;}
	}
	if (!f) {res = '1' + res;} n = res.length();
	for (int i = 0; i < n; i++)
		res[n - 1 - i] = res[i];
	return res;
}
]]),
})

ls.add_snippets("cpp", {
	gcdxy,
	isprime,
	lcm,
	arraybfs2D,
	arraydfs2D,
	arraydfs3D,
	hillvalley,
	rotate_square_matrix,
	infix_postfix,
	minimum_swaps,
    next_palindrome
})
