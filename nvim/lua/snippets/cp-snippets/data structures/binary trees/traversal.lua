
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("traversal", {
        t([[
    void preorder() {
        auto rec = [&](node<T> *cur, const auto & self) -> void {
            if (cur == NULL)return;
            cout << ' ' << cur->data;
            self(cur->left, self);
            self(cur->right, self);
        };
        rec(root, rec);
    }
    void inorder() {
        auto rec = [&](node<T> *cur, const auto & self) -> void {
            if (cur == NULL)return;
            self(cur->left, self);
            cout << ' ' << cur->data;
            self(cur->right, self);
        };
        rec(root, rec);
    }
    void postorder() {
        auto rec = [&](node<T> *cur, const auto & self) -> void {
            if (cur == NULL)return;
            self(cur->left, self);
            self(cur->right, self);
            cout << ' ' << cur->data;
        };
        rec(root, rec);
    }
]]),
    }),
})
