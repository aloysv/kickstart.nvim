local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('cppbase', {
    t {
      '#ifdef ONPC',
      '    #define _GLIBCXX_DEBUG',
      '#endif',
      '#include <bits/stdc++.h>',
      'using namespace std;',
      'using ll = long long;',
      'using ld = long double;',
      '',
      'const int INF = 1e9;',
      '',
      'int solve(int numTests, int currentTestIndex) {',
      '    ',
    },
    i(1),
    t {
      '',
      '    return 0;',
      '}',
      '',
      'int main() {',
      '    ios_base::sync_with_stdio(false);',
      '    cin.tie(nullptr);',
      '    int t = 1;',
      '    cin >> t;',
      '    for (int i = 0; i < t; i++) {',
      '        if (solve(t, i)) {',
      '            break;',
      '        }',
      '        #ifdef ONPC',
      '            cout << "_________________________" << endl;',
      '        #endif',
      '    }',
      '    #ifdef ONPC',
      '        cerr << endl << "finished in " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << endl;',
      '    #endif',
      '    return 0;',
      '}',
    },
  }),
}
