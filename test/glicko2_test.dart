import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/glicko2.dart';

void main() {
  test('Glicko2 test', () {
    // プレイヤーの初期評価などを設定
    final player1 = Player(1500.0, 200.0, 0.06);
    final player2 = Player(1400.0, 30.0, 0.06);
    final player3 = Player(1550.0, 100.0, 0.06);
    final player4 = Player(1700.0, 300.0, 0.06);
    final player5 = Player(1350.0, 80.0, 0.06);
    final player6 = Player(1450.0, 120.0, 0.06);

    // プレイヤーリストと試合結果を設定
    final players = [player1, player2, player3, player4, player5, player6];
    final match1 = Match([player1, player2, player3], [player4, player5, player6], 1.0);
    // final match2 = Match([player1, player2], [player3, player4, player5], 0.4);

    final matches = [match1];

    // Glicko-2 システムを適用
    glicko2(players, matches);

    // 更新された評価を表示
    for (final player in players) {
      debugPrint('Player Rating: ${player.rating.toStringAsFixed(2)}');
      debugPrint('Player RD (Rating Deviation): ${player.ratingDeviation.toStringAsFixed(2)}');
      debugPrint('Player Volatility: ${player.volatility.toStringAsFixed(2)}');
    }
    // debugPrint("Shortest Distance: $shortestDistance");
    // debugPrint("Shortest Path: $shortestPath");
  });
}