/// 集合の和と所属を求めるデータセットのアルゴリズム
/// find: 根を返す。一度検索されたら根に経路圧縮される
/// union: rankに応じて結合する木を調整しながら結合する（木の高さを低く保つ）
///
/// Kruskal's algorithm においては、edgeの管理と所属をチェックする為に使用
/// （＝循環する所属になっていないかどうか）

class UnionFind {
  late List<int> parent;
  late List<int> rank;

  UnionFind(int size) {
    parent = List<int>.generate(size, (index) => index);
    rank = List<int>.filled(size, 0);
  }

  int find(int x) {
    if (parent[x] != x) {
      // 検索された子から根に直繋ぎして経路圧縮する
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int x, int y) {
    int rootX = find(x);
    int rootY = find(y);

    if (rootX == rootY) {
      return; // Already in the same set
    }

    if (rank[rootX] < rank[rootY]) {
      parent[rootX] = rootY;
    } else if (rank[rootX] > rank[rootY]) {
      parent[rootY] = rootX;
    } else {
      parent[rootY] = rootX;
      rank[rootX]++;
    }
  }
  bool isConnected(int x, int y) {
    return find(x) == find(y);
  }
}
