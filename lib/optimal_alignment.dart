import 'dart:math';

/// Needleman Wunsch の Global Alignment algorithm
/// 同一スコアで複数のオペレーションが発生した場合、その全てを網羅するのは動作対象外。
/// 必要になったシーンで実装すること。
class NeedlemanWunsch {
  final String _sequence1;
  final String _sequence2;
  final int _matchScore;
  final int _mismatchScore;
  final int _gapPenalty;
  late List<List<int>> scoreMatrix;
  late List<List<String>> operationMatrix;

  NeedlemanWunsch(this._sequence1, this._sequence2, this._matchScore,
      this._mismatchScore, this._gapPenalty) {
    scoreMatrix = List.generate(_sequence1.length + 1,
        (i) => List<int>.filled(_sequence2.length + 1, 0));
    operationMatrix = List.generate(_sequence1.length + 1,
        (i) => List<String>.filled(_sequence2.length + 1, ""));
  }

  void calculateScoreMatrix() {
    // Initialize the first row and column
    for (int i = 0; i <= _sequence1.length; i++) {
      scoreMatrix[i][0] = i * _gapPenalty;
    }
    for (int j = 0; j <= _sequence2.length; j++) {
      scoreMatrix[0][j] = j * _gapPenalty;
    }

    // Fill in the score matrix and operation matrix
    for (int i = 1; i <= _sequence1.length; i++) {
      for (int j = 1; j <= _sequence2.length; j++) {
        int match = scoreMatrix[i - 1][j - 1] +
            (_sequence1[i - 1] == _sequence2[j - 1]
                ? _matchScore
                : _mismatchScore);
        int delete = scoreMatrix[i - 1][j] + _gapPenalty;
        int insert = scoreMatrix[i][j - 1] + _gapPenalty;

        int maxScore = [match, delete, insert].reduce(max);
        scoreMatrix[i][j] = maxScore;

        if (maxScore == match) {
          operationMatrix[i][j] = "Match";
        } else if (maxScore == delete) {
          operationMatrix[i][j] = "Delete";
        } else {
          operationMatrix[i][j] = "Insert";
        }
      }
    }
  }

  int getAlignmentScore() {
    return scoreMatrix[_sequence1.length][_sequence2.length];
  }

  List<String> getAlignment() {
    int i = _sequence1.length;
    int j = _sequence2.length;
    String alignedSeq1 = "";
    String alignedSeq2 = "";

    while (i > 0 && j > 0) {
      String operation = operationMatrix[i][j];
      if (operation == "Match") {
        alignedSeq1 = _sequence1[i - 1] + alignedSeq1;
        alignedSeq2 = _sequence2[j - 1] + alignedSeq2;
        i--;
        j--;
      } else if (operation == "Delete") {
        alignedSeq1 = _sequence1[i - 1] + alignedSeq1;
        alignedSeq2 = "-$alignedSeq2";
        i--;
      } else {
        alignedSeq1 = "-$alignedSeq1";
        alignedSeq2 = _sequence2[j - 1] + alignedSeq2;
        j--;
      }
    }

    while (i > 0) {
      alignedSeq1 = _sequence1[i - 1] + alignedSeq1;
      alignedSeq2 = "-$alignedSeq2";
      i--;
    }

    while (j > 0) {
      alignedSeq1 = "-$alignedSeq1";
      alignedSeq2 = _sequence2[j - 1] + alignedSeq2;
      j--;
    }

    return [alignedSeq1, alignedSeq2];
  }
}
