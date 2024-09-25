local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node


local basic =
s("cpbasic",
	fmt(
		[[
#include <iostream>
using namespace std;

int main() {{
	{}
	return 0;
}}
]],
		{i(1, "// Your code here")})
)

local boiler =
s("cpboiler", fmt([[
#include<bits/stdc++.h>
using namespace std;
int main() {{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int T;
    cin >> T;
    while (T--) {{     
 		{}
	}}
    return 0;
}}
]],
	{i(1, "// Your code here")})
)


local debug =
s("cpdebug", {
        t([[
template<typename... T>
void deb(T... args) {
	((cout << args << ' '), ...); cout << '\n';
}
]]),
})

local header =
s("cpheader", {
        t([[
/*
	Author : yk_2310/theLastAckerman 
	Date   : 
	Time   : 
*/
]]),
})

local judge =
s("cpjudge", {
        t([[
#ifndef ONLINE_JUDGE
	freopen("input.in", "r", stdin);
	freopen("output.in", "w", stdout);
#endif
]]),
})

local kickstart =
s("kickstart",
        fmt([[
#include<bits/stdc++.h>
using namespace std;

void solve(int test) {{
	{}
}}

int main() {{

    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int T;
    cin >> T;
    for (int i = 1; i <= T; i++) {{
        solve(i);
    }}

    return 0;
}}
]], {i(1, "// Your code here")}
))

ls.add_snippets("cpp", {
	basic,
	boiler,
	debug,
	header,
	judge,
	kickstart
})

