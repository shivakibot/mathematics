import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/probability/bayes.dart';

void main() {
  group('bayes test', () {
    test('dice', () {
      /// 1から3の目が赤色で塗られており、
      /// 4から6の目は青色で塗られているさいころがある。
      /// 今、このさいころを投げて青色の目が出た時、(=B)
      /// この目が偶数である確率を求めよ。(=A)
      Bayes model = Bayes();
      const double cpB = 2/6;
      const double pA = 3/6;
      final res = model.calculatePosteriorProbability(cpB, pA);
      debugPrint("事象A $pA、事象A given B $cpB、$resで発生");
      // debugPrint("Shortest Distance: $shortestDistance");
      // debugPrint("Shortest Path: $shortestPath");
    });

    test('disease 〇', () {
      Bayes model = Bayes();
      double pBA = 0.95; // P(B|A): 病気にかかっている人が陽性の結果を示す確率
      double pA = 0.001; // P(A): 病気にかかっている人の割合
      double pNotA = 1 - pA; // 病気にかかっていない人の割合
      double pBGivenNotA = 0.10; // P(B|A^C): 病気にかかっていない人が陽性の結果を示す確率

      // P(B): 陽性の結果を示す確率
      double pB = (pBA * pA) + (pBGivenNotA * pNotA);

      // ベイズの定理を使用して P(A|B) を計算
      double pAB = model.bayesTheorem(pBA, pA, pB);
      debugPrint('P(A|B) = $pAB');
      // debugPrint("Shortest Distance: $shortestDistance");
      // debugPrint("Shortest Path: $shortestPath");
    });

    test('stock 〇', () {
      Bayes model = Bayes();
      double pBA = 0.70; // P(A∣B)：好業績を上げる場合に将来の価格が上昇する確率
      double pBA_ = 0.20; // P(A∣¬B)：悪業績を示す場合に将来の価格が上昇する確率
      double pB = 0.60; // P(B)：過去のデータから好業績を上げる確率
      double pB_ = 0.40; // P(¬B)：過去のデータから悪業績を示す確率

      double pA = model.multiplicative(pBA, pB);
      double pA_ = model.multiplicative(pBA_, pB_);
      debugPrint('P(A) = ${pA+pA_}');
      // debugPrint("Shortest Distance: $shortestDistance");
      // debugPrint("Shortest Path: $shortestPath");
    });

    test('buy item for marketing 〇', () {
      Bayes model = Bayes();
      double pBA = 0.30; // P(A∣B)：好業績を上げる場合に将来の価格が上昇する確率
      double pBA_ = 0.10; // P(A∣¬B)：悪業績を示す場合に将来の価格が上昇する確率
      double pB = 0.20; // P(B)：過去のデータから好業績を上げる確率
      double pB_ = 0.80; // P(¬B)：過去のデータから悪業績を示す確率

      double pA = model.multiplicative(pBA, pB);
      double pA_ = model.multiplicative(pBA_, pB_);
      debugPrint('P(A) = ${pA+pA_}');
      // debugPrint("Shortest Distance: $shortestDistance");
      // debugPrint("Shortest Path: $shortestPath");
    });
  });

}
