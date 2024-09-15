local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tseive", snippetType = "autosnippet"}, {
    t("
template<int n>
struct seive {
    array <int, n + 1> s;
    vector<int> primes;
    seive() {
        s.fill(0);s[0] = 0; s[1] = 1;
        for (int i = 2; i < n + 1; i++) {
            if (s[i] == 0) {
                s[i] = i; primes.push_back(i);
                for (int j = i; j < n + 1; j += i) {if (s[j] == 0)s[j] = i;}
            }
        }
    }

    vector<int> getprimes(int a = 1, int b = n) {
        int it = lower_bound(primes.begin(), primes.end(), a) - primes.begin();
        int jt = upper_bound(primes.begin(), primes.end(), b) - primes.begin();
        return vector<int>(primes.begin() + it, primes.begin() + jt);
    }

    template<typename T>
    bool checkprime(T num) {
        if (num == 1)return false;
        for (int i = 0; i < (int)primes.size() && (T)primes[i]*primes[i] <= num; i++) {
            if (num % primes[i] == 0)return false;
        }
        return true;
    }

    template<typename T>
    map<int, int> get_factors(T num) {
        map<int, int> mp;
        while (num > 1) {
            mp[s[num]]++;
            num /= s[num];
        }
        return mp;
    }
};
"),
  }),
}
