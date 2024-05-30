import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/expectation.dart';


void main() {
  group('Expectation Test', () {
    test('dice B: odd number', () {
      /// あるゲームのサイコロを振って、出た目を確率変数 X で表します。
      /// さらに、ある条件B が与えられた場合の確率分布が以下のように与えられています。
      /// 条件B は、出た目が奇数であることとする。
      Map<int, double> distribution = {
        1: 0.10,
        2: 0.20,
        3: 0.30,
        4: 0.20,
        5: 0.10,
        6: 0.10,
      };
      Set<int> condition = {1, 2, 3, 4, 5, 6};
      double conditionalExp = Expectation.conditionalExpectation(distribution, condition);
      debugPrint('E[X∣B]: ${conditionalExp.toStringAsFixed(2)}'); // E[X∣B]: 3.3
    });
  });

}