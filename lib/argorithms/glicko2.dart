import 'dart:math';

import 'package:flutter/cupertino.dart';

class Player {
  late double rating; // プレイヤーのレーティング
  late double ratingDeviation; // プレイヤーのレーティングの不確実性
  late double volatility; // プレイヤーの評価の安定性
  late double mu; // 評価の平均値
  late double phi; // 評価の精度
  late double sigma; // 評価の標準偏差

  Player(this.rating, this.ratingDeviation, this.volatility);
}

class Match {
  List<Player> teamA; // チームAのプレイヤー
  List<Player> teamB; // チームBのプレイヤー
  double teamAResult; // チームAの試合結果（通常は0から1の値）

  Match(this.teamA, this.teamB, this.teamAResult);
}

// Glicko-2 システムの計算
void glicko2(List<Player> players, List<Match> matches) {
  const tau = 0.5; // システムのパラメータ

  // すべてのプレイヤーについて計算を行う
  for (final player in players) {
    // プレイヤーの新しい評価を計算
    final sum = matches.fold(0.0, (double acc, match) {
      final result = match.teamA.contains(player)
          ? match.teamAResult
          : 1.0 - match.teamAResult;
      final opponentTeam =
          match.teamA.contains(player) ? match.teamB : match.teamA;
      final expectedOutcome = 1.0 /
          (1.0 +
              exp(-tau *
                  (player.rating - opponentTeamAverageRating(opponentTeam))));
      return acc + phi(player.ratingDeviation) * (result - expectedOutcome);
    });
    final newRating = player.rating +
        (tau / (player.ratingDeviation * player.ratingDeviation)) * sum;

    // プレイヤーの新しい評価の不確実性を計算
    final phiStar = sqrt(player.ratingDeviation * player.ratingDeviation +
        tau *
            tau *
            matches.fold(0.0, (num acc, match) {
              final opponentTeam =
                  match.teamA.contains(player) ? match.teamB : match.teamA;
              final expectedOutcome = 1.0 /
                  (1.0 +
                      exp(-tau *
                          (player.rating -
                              opponentTeamAverageRating(opponentTeam))));
              return acc +
                  phi(player.ratingDeviation) *
                      phi(player.ratingDeviation) *
                      expectedOutcome *
                      (1.0 - expectedOutcome);
            }));
    final newRatingDeviation = 1.0 /
        sqrt(1.0 / (phiStar * phiStar) +
            1.0 / (player.volatility * player.volatility));

    // プレイヤーの新しい評価の安定性を更新
    final newVolatility = sqrt((newRatingDeviation * newRatingDeviation) -
        (player.ratingDeviation * player.ratingDeviation));

    // プレイヤーの評価を更新
    debugPrint('player.rating: ${player.rating} -> $newRating');
    player.rating = newRating;
    player.ratingDeviation = newRatingDeviation;
    player.volatility = newVolatility;

  }
}

// 相手チームの平均評価を計算
double opponentTeamAverageRating(List<Player> team) {
  final sum = team.fold(0.0, (double acc, player) => acc + player.rating);
  return sum / team.length;
}

// 主要な計算関数
double phi(double deviation) {
  return 1.0 / sqrt(1.0 + 3.0 * deviation * deviation / (pi * pi));
}
