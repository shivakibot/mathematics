class Expectation{
  // 条件付き期待値を計算する関数
  static double conditionalExpectation(Map<int, double> distribution, Set<int> condition) {
    double sum = 0;
    double totalProbability = 0;

    // 条件付き確率を計算し、条件付き期待値を合計する
    distribution.forEach((value, probability) {
      if (condition.contains(value)) {
        sum += value * probability;
        totalProbability += probability;
      }
    });
    // debugPrint('sum = $sum');
    // debugPrint('totalProbability = $totalProbability');
    // 条件付き期待値を返す
    return sum / totalProbability;
  }
}