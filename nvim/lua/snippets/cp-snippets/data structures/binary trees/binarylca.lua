
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("LCAbinary", {
        t([[
set<T> all_nodes;
T find_lca(T a, T b) {
    auto rec = [&](node<T> * cur, const auto & self) -> void{
        if (cur == NULL) return; self(cur->left, self);
        all_nodes.insert(cur->data); self(cur->right, self);
    };
    rec(root, rec);
    if (all_nodes.find(a) == all_nodes.end() || all_nodes.find(b) == all_nodes.end()) return T();
    auto lca_util = [&](node<T> *cur, T x, T y, const auto & self) -> node<T> * {
        if (cur == NULL)return NULL;
        if (cur->data == x || cur->data == y) return cur;
        node<T> * left_cur = self(cur->left, x, y, self);
        node<T> * right_cur = self(cur->right, x, y, self);
        if (left_cur && right_cur) return cur;
        return (left_cur != NULL) ? left_cur : right_cur;
    };
    return lca_util(root, a, b, lca_util) -> data;
}
]]),
    }),
})
