import 'package:flutter/material.dart';

import '../models/technical_test_question.dart';
import '../models/technical_test_result.dart';

class TechnicalTestFuzzyEngine {
  static double _trimf(double x, double a, double b, double c) {
    if (x <= a || x >= c) {
      return 0;
    }
    if (x == b) {
      return 1;
    }
    if (x < b) {
      return (x - a) / (b - a);
    }
    return (c - x) / (c - b);
  }

  static TechnicalTestResult calculate({
    required List<TechnicalTestQuestion> questions,
    required Map<String, int> answers,
    required Map<String, double> difficultyWeights,
  }) {
    double totalWeight = 0;
    double earnedWeight = 0;
    int correctCount = 0;

    final categoryTotals = <String, double>{};
    final categoryEarned = <String, double>{};

    for (final question in questions) {
      final selectedIndex = answers[question.id];
      final isCorrect = selectedIndex == question.correctIndex;
      final difficultyMultiplier = difficultyWeights[question.difficulty] ?? 1.0;
      final effectiveWeight = question.weight * difficultyMultiplier;

      totalWeight += effectiveWeight;
      categoryTotals[question.category] =
          (categoryTotals[question.category] ?? 0) + effectiveWeight;

      if (isCorrect) {
        earnedWeight += effectiveWeight;
        correctCount += 1;
        categoryEarned[question.category] =
            (categoryEarned[question.category] ?? 0) + effectiveWeight;
      }
    }

    final score = totalWeight == 0 ? 0.0 : (earnedWeight / totalWeight) * 100;

    final categoryScores = <String, double>{};
    for (final entry in categoryTotals.entries) {
      final earned = categoryEarned[entry.key] ?? 0;
      categoryScores[entry.key] = entry.value == 0 ? 0 : (earned / entry.value) * 100;
    }

    final weakCategories = categoryScores.entries
        .where((entry) => entry.value < 60)
        .map((entry) => entry.key)
        .toList(growable: false);

    final low = _trimf(score, 0, 25, 45);
    final mid = _trimf(score, 35, 55, 75);
    final high = _trimf(score, 65, 85, 100);

    final memberships = <_ProfileCandidate>[
      _ProfileCandidate(
        strength: low,
        profile: const TechnicalTestResultProfile(
          title: 'Temel Seviye',
          description:
              'Teknik terimlerde tekrar ve kelime çalışmasıyla hızlı ilerleme sağlayabilirsin.',
          color: Color(0xFFEF4444),
        ),
      ),
      _ProfileCandidate(
        strength: mid,
        profile: const TechnicalTestResultProfile(
          title: 'Gelişen Seviye',
          description:
              'Temel yapıyı biliyorsun; alan bazlı kelimeleri pekiştirirsen çok daha güçlü olursun.',
          color: Color(0xFFF59E0B),
        ),
      ),
      _ProfileCandidate(
        strength: high,
        profile: const TechnicalTestResultProfile(
          title: 'İleri Seviye',
          description:
              'Teknik İngilizce altyapın güçlü. Daha zor senaryo ve alan terimlerine geçebilirsin.',
          color: Color(0xFF10B981),
        ),
      ),
    ]..sort((a, b) => b.strength.compareTo(a.strength));

    final profile = memberships.first.profile;

    return TechnicalTestResult(
      score: score,
      correctCount: correctCount,
      totalCount: questions.length,
      earnedWeight: earnedWeight,
      totalWeight: totalWeight,
      categoryScores: categoryScores,
      weakCategories: weakCategories,
      profile: profile,
    );
  }
}

class _ProfileCandidate {
  final double strength;
  final TechnicalTestResultProfile profile;

  const _ProfileCandidate({required this.strength, required this.profile});
}
