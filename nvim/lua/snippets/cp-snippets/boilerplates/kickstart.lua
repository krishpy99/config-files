local s = require("luasnip").snippet
local t = require("luasnip").text_node

return    {
	s("kickstart", {
        t([[
#include<bits/stdc++.h>
using namespace std;

void solve(int test) {

}

int main() {

    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int T;
    cin >> T;
    for (int i = 1; i <= T; i++) {
        solve(i);
    }

    return 0;
}
]]),
    }),
}
