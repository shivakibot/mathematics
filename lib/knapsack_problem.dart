import 'dart:math';

/// ナップサック問題
/// 漸化式によってアイテムiを入れた場合、入れなかった場合の内、価値が高い方で表を更新していく。
/// 100, 100もやると処理できなくなるかも
/// 最大価値は dpTable[n][capacity]
/// 最適解の復元（選択されたアイテム群）はdpTableからバックトレースして行う。
class KnapsackProblem {
  static List<List<int>> buildDpTable(List<int> weights, List<int> values, int capacity) {
    int itemCount = weights.length;
    List<List<int>> dpTable = List.generate(itemCount + 1, (_) => List<int>.filled(capacity + 1, 0));

    for (int i = 1; i <= itemCount; i++) {
      for (int j = 1; j <= capacity; j++) {
        /// capacity をオーバーした場合は、左の値を部分最適解としてコピーして次へ
        if (weights[i - 1] <= j) {
          dpTable[i][j] = max(dpTable[i - 1][j],dpTable[i - 1][j - weights[i - 1]] + values[i - 1]);
        } else {
          dpTable[i][j] = dpTable[i - 1][j];
        }
      }
    }

    return dpTable;
  }
  static int maxValue(List<List<int>> dpTable){
    return dpTable[dpTable.length - 1][dpTable[0].length - 1];
  }
  static List<int> knapsackBacktrack(List<List<int>> dpTable, List<int> weights, List<int> values, int capacity) {
    List<int> selectedItems = [];

    int i = dpTable.length - 1;
    int j = dpTable[0].length - 1;

    while (i > 0 && j > 0) {
      if (dpTable[i][j] != dpTable[i - 1][j]) {
        selectedItems.add(i - 1);
        j -= weights[i - 1];
      }
      i--;
    }

    return selectedItems;
  }
}