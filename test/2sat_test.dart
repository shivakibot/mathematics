import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/2sat.dart';

void main() {
  test('2-SAT test', () {
    // 2-SAT問題を解くためのインスタンスを作成
    TwoSAT twoSAT = TwoSAT(2);

    // 2-SATの節を追加
    twoSAT.addClause(1, -2);
    twoSAT.addClause(-1, 2);

    // 問題を解く
    bool isSatisfiable = twoSAT.isSatisfiable();

    if (isSatisfiable) {
      debugPrint("2-SAT問題は充足可能です");
    } else {
      debugPrint("2-SAT問題は充足不可能です");
    }
    // debugPrint("Shortest Distance: $shortestDistance");
    // debugPrint("Shortest Path: $shortestPath");
  });
}