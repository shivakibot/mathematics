import 'dart:math';

// 二項係数を計算する関数
int _binomialCoefficient(int n, int k) {
  if (k == 0 || k == n) {
    return 1;
  } else {
    int numerator = _factorial(n);
    int denominator = _factorial(k) * _factorial(n - k);
    return numerator ~/ (denominator); // 除算の結果を整数として返す
  }
}

// 階乗を計算する関数
int _factorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}

/// 二項分布関数
///
///
double binomialDistribution(int n, int k, double p) {
  num coefficient = _binomialCoefficient(n, k);
  num probability = coefficient * pow(p, k) * pow(1 - p, n - k);
  return probability.toDouble();
}

/// ポアソン分布関数
/// 発生確率が低く、試行回数が膨大な場合に使用される。
/// 製品の不良品発生率など、製品評価として利用される。
double poissonDistribution(int k, double lambda) {
  double numerator = pow(lambda, k) * exp(-lambda);
  int denominator = _factorial(k);
  return numerator / denominator;
}
