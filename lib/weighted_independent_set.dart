import 'dart:math';

int weightedIndependentSet(List<int> weights) {
  int n = weights.length;
  List<int> dp = List.filled(n + 1, 0);

  for (int i = 1; i <= n; i++) {
    dp[i] = i >= 2 ? max(dp[i - 1], dp[i - 2] + weights[i - 1]) : weights[i - 1];
  }

  return dp[n];
}