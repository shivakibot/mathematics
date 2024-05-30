/// 基本的には計測したい条件付き確率のユースケースに対して
/// 計算式を組み立てて個別に業務ロジックとして機能させる。
///
/// ベイズの定理の加法定理（全事象を計算）
/// ベイズの定理の乗法定理（事象Bが起きた時の事象Aが起こる条件確率）
/// に基づいて作成すること。
/// P(A∣B)= P(A∩B) / P(A)
/// P(A∩B) =
class Bayes {
  double calculatePosteriorProbability(
      // 事象Bが起きたときの事象Aの条件付き確率
      double conditionalProbabilityAGivenB,
      // 事象Aの事前確率
      double priorProbabilityA) {
    double posteriorProbability = conditionalProbabilityAGivenB / priorProbabilityA;

    return posteriorProbability;
  }

  // ベイズの定理を計算する関数
  double bayesTheorem(double pBA, double pA, double pB) {
    return (pBA * pA) / pB;
  }

  /// ベイズの乗法定理
  /// P(A∣B)⋅* P(B)
  double multiplicative(double pBA, double pB){
    return pBA * pB;
  }
}
