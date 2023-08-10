/// 最適探索二分木のアルゴリズム
/// 標準的なもので計算量は O(n^3)
/// 生成のアルゴリズムでより計算量が少ないものもあるみたいだが、
/// 最適探索二分木で管理するデータの容量を増やしたいタイミングで再検討すること。
class OptimalBST {
  static Node? constructOptimalBST(List<double> keys, List<double> probabilities) {
    int n = keys.length;

    List<List<double>> cost = List.generate(n + 2, (index) => List.filled(n + 1, 0.0));
    List<List<double>> weightedCost = List.generate(n + 2, (index) => List.filled(n + 1, 0.0));

    for (int i = 1; i <= n; i++) {
      cost[i][i - 1] = 0;
      cost[i][i] = probabilities[i - 1];
      weightedCost[i][i - 1] = 0;
      weightedCost[i][i] = probabilities[i - 1];
    }

    for (int len = 2; len <= n; len++) {
      for (int i = 1; i <= n - len + 1; i++) {
        int j = i + len - 1;
        cost[i][j] = double.infinity;
        weightedCost[i][j] = weightedCost[i][j - 1] + probabilities[j - 1];

        for (int r = i; r <= j; r++) {
          double tempCost = cost[i][r - 1] + cost[r + 1][j] + weightedCost[i][j];
          if (tempCost < cost[i][j]) {
            cost[i][j] = tempCost;
          }
        }
      }
    }

    return _constructTree(keys, 1, n, cost);
  }

  static Node? _constructTree(List<double> keys, int i, int j, List<List<double>> cost) {
    if (i > j) {
      return null;
    }

    int minRootIndex = i;
    for (int k = i; k <= j; k++) {
      if (cost[i][j] == cost[i][k - 1] + cost[k + 1][j] + cost[k][k]) {
        minRootIndex = k;
        break;
      }
    }

    Node root = Node(keys[minRootIndex - 1]);
    root.left = _constructTree(keys, i, minRootIndex - 1, cost);
    root.right = _constructTree(keys, minRootIndex + 1, j, cost);

    return root;
  }

  static Node? search(Node? root, double key) {
    if (root == null || root.key == key) {
      return root;
    }

    if (key < root.key) {
      return search(root.left, key);
    }

    return search(root.right, key);
  }
}

class Node {
  double key;
  Node? left;
  Node? right;

  Node(this.key, {this.left, this.right});
}