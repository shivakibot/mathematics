import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/distribution.dart';


void main() {
  group('Distribution Test', () {
    test('binomial', () {
      int n = 10; // 試行の総数
      int k = 3; // 成功する回数
      double p = 0.5; // 各試行で成功する確率

      double probability = binomialDistribution(n, k, p);

      debugPrint('二項分布の確率: $probability'); // A: 0.117
      // debugPrint('最終容量行列: ${solver.capacity}');
      // debugPrint('隣接行列: ${solver.adj}');
    });
    test('poisson', () {
      int k = 3; // 発生回数
      double lambda = 5; // 平均発生回数 λ
      var list = List.generate(k + 1, (i)=> i);
      double probability = 0;
      for(int v in list){
          probability += poissonDistribution(v, lambda);
      }
      debugPrint('list: $list'); // A: list: [0, 1, 2, 3]
      debugPrint('ポアソン分布の確率: $probability'); // A: 0.2650259152973617
      // debugPrint('最終容量行列: ${solver.capacity}');
      // debugPrint('隣接行列: ${solver.adj}');
    });
  });

}