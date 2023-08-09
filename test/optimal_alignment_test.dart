import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/optimal_alignment.dart';

void main() {
  test('NeedlemanWunsch test', () {
    /// var
    String sequence1 = "ATTGC";
    String sequence2 = "ATGC";
    int matchScore = 2;
    int mismatchScore = -1;
    int gapPenalty = -2;
    List<String> alignedSequences;

    /// exec
    NeedlemanWunsch nw = NeedlemanWunsch(sequence1, sequence2, matchScore, mismatchScore, gapPenalty);
    nw.calculateScoreMatrix();
    alignedSequences = nw.getAlignment();
    debugPrint("score matrix: ${nw.scoreMatrix}");
    debugPrint("Aligned score: ${nw.getAlignmentScore()}");
    debugPrint("Aligned Sequence 1: ${alignedSequences[0]}");
    debugPrint("Aligned Sequence 2: ${alignedSequences[1]}");

    /// check answer
    String alignedSeq2 =  "A-TGC";
    int alignedScore = 6;
    expect(alignedScore, nw.getAlignmentScore());
    expect(alignedSequences[0], sequence1);
    expect(alignedSequences[1], alignedSeq2);
  });
}