
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("boiler", {
        t([[
#include<bits/stdc++.h>
using namespace std;

int main() {

	ios::sync_with_stdio(false);
	cin.tie(nullptr);

    int T;
    cin >> T;
    while (T--) {

    }

    return 0;
}
]]),
    }),
})
