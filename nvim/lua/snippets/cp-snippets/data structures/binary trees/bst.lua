
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("bst", {
        t([[
template<typename T>
struct node {
    T data;
    node<T> *left, *right;

    node() {this = NULL;}
    node(T val): left(NULL), right(NULL) {data = val;}
};

template<typename T>
struct bst {
    node<T> *root;
    bst() {root = NULL;}

    void insert(T val) {
        auto rec = [&](node<T> * &cur, T val, const auto & self) -> void {
            if (cur == NULL) {
                cur = new node<T>(val); return;
            }
            if (cur->data >= val) self(cur->left, val, self);
            else self(cur->right, val, self);
        };
        rec(root, val, rec);
    }

    void showtree() {
        auto rec = [&](node<T> * cur, int level, string s, const auto & self) -> void{
            if (cur == NULL) return;
            self(cur->left, level + 1, s + "->left", self);
            cout << s << ' ' << level << ": " << cur->data << '\n';
            self(cur->right, level + 1, s + "->right", self);
        };
        rec(root, 0, "root", rec);
    }
};
]]),
    }),
})
