import 'package:flutter/material.dart';

class TechnicalTestResultProfile {
  final String title;
  final String description;
  final Color color;

  const TechnicalTestResultProfile({
    required this.title,
    required this.description,
    required this.color,
  });
}

class TechnicalTestResult {
  final double score;
  final int correctCount;
  final int totalCount;
  final double earnedWeight;
  final double totalWeight;
  final Map<String, double> categoryScores;
  final List<String> weakCategories;
  final TechnicalTestResultProfile profile;

  const TechnicalTestResult({
    required this.score,
    required this.correctCount,
    required this.totalCount,
    required this.earnedWeight,
    required this.totalWeight,
    required this.categoryScores,
    required this.weakCategories,
    required this.profile,
  });
}
