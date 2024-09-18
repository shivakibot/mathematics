class TwoSAT {
  final int numVariables;
  late List<List<int>> clauses;

  TwoSAT(this.numVariables);

  void addClause(int var1, int var2) {
    clauses = List.generate(2 * numVariables, (_) => []);

    // 変数 x に対する正と否定の値をインデックスで表現
    // 例えば、変数 x1 に対しては、x1の正と否定はそれぞれ 2*1 - 2 = 0 と 2*1 - 1 = 1 に対応する
    var1 = (var1 > 0) ? 2 * var1 - 2 : -2 * var1 - 1;
    var2 = (var2 > 0) ? 2 * var2 - 2 : -2 * var2 - 1;

    clauses[var1].add(var2);
  }

  bool isSatisfiable() {
    // 強連結成分を求めるためにKosaraju's Algorithmを使用
    List<List<int>> graph = List.generate(2 * numVariables, (_) => []);

    for (int i = 0; i < clauses.length; i++) {
      for (int j in clauses[i]) {
        graph[i].add(j);
      }
    }

    List<int> reversedOrder = [];

    void dfs1(int v) {
      if (reversedOrder.contains(v)) return;
      reversedOrder.add(v);
      for (int u in graph[v]) {
        dfs1(u);
      }
    }

    for (int i = 0; i < 2 * numVariables; i++) {
      dfs1(i);
    }

    List<int> component = List.generate(2 * numVariables, (_) => -1);
    int componentCount = 0;

    void dfs2(int v) {
      if (component[v] != -1) return;
      component[v] = componentCount;
      for (int u in graph[v]) {
        dfs2(u);
      }
    }

    for (int i = reversedOrder.length - 1; i >= 0; i--) {
      int v = reversedOrder[i];
      if (component[v] == -1) {
        dfs2(v);
        componentCount++;
      }
    }

    for (int i = 0; i < 2 * numVariables; i += 2) {
      if (component[i] == component[i + 1]) {
        return false; // 同じ強連結成分内で変数とその否定が含まれている場合、不可能
      }
    }

    return true;
  }
}