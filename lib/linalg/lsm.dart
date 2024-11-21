/// 最小二乗法(least square method)
///
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
