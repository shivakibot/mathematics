// import 'dart:math';

/// 最小二乗法(least square method)
///
class Lsm{
  Map<String, double> linearRegression(List<double> x, List<double> y) {
    // データポイントの数
    int n = x.length;

    // 平均を計算
    double meanX = x.reduce((a, b) => a + b) / n;
    double meanY = y.reduce((a, b) => a + b) / n;

    // 分子と分母を計算
    double numerator = 0.0;
    double denominator = 0.0;
    for (int i = 0; i < n; i++) {
      numerator += (x[i] - meanX) * (y[i] - meanY);
      denominator += (x[i] - meanX) * (x[i] - meanX);
    }

    // 傾き（slope）を計算
    double slope = numerator / denominator;

    // 切片（intercept）を計算
    double intercept = meanY - slope * meanX;

    return {'slope': slope, 'intercept': intercept};
  }

  // Map<String, double> nonlinearRegression(List<double> x, List<double> y, double a, double b,
  //     {int maxIterations = 1000, double tolerance = 1e-6}) {
  //   int n = x.length;
  //   double learningRate = 0.01; // 学習率（ステップサイズ）
  //
  //   for (int iteration = 0; iteration < maxIterations; iteration++) {
  //     double da = 0.0;
  //     double db = 0.0;
  //     double errorSum = 0.0;
  //
  //     // 勾配の計算
  //     for (int i = 0; i < n; i++) {
  //       double predicted = a * exp(b * x[i]);
  //       double error = y[i] - predicted;
  //       errorSum += error * error;
  //
  //       // パラメータの偏微分
  //       da += -2 * error * exp(b * x[i]);
  //       db += -2 * error * a * x[i] * exp(b * x[i]);
  //     }
  //
  //     // パラメータの更新
  //     a -= learningRate * da;
  //     b -= learningRate * db;
  //
  //     // 収束判定
  //     if (sqrt(da * da + db * db) < tolerance) {
  //       break;
  //     }
  //   }
  //
  //   return {'a': a, 'b': b};
  // }
}


