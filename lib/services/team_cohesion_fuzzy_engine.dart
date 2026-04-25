import 'dart:math';
import '../models/team_cohesion_question_model.dart';

class TeamCohesionFuzzyEngine {
  // Üçgen üyelik fonksiyonu
  static double _trimf(double x, double a, double b, double c) {
    return max(0, min((x - a) / (b - a), (c - x) / (c - b)));
  }

  static double calculate(Map<Category, double> scores) {
    // 1. Bulanıklaştırma (Fuzzification)
    Map<Category, Map<String, double>> fuzzyValues = {};

    scores.forEach((cat, val) {
      fuzzyValues[cat] = {
        'low': _trimf(val, 0, 1, 3),
        'mid': _trimf(val, 1.5, 3, 4.5),
        'high': _trimf(val, 3, 5, 6),
      };
    });

    // 2. Kural Tabanı & Ağırlıklı Ortalama (Mamdani Inference basitleştirilmiş)
    double totalWeight = 0;
    double weightedSum = 0;

    void addRule(double weight, double resultScore) {
      if (weight > 0) {
        totalWeight += weight;
        weightedSum += weight * resultScore;
      }
    }

    var e = fuzzyValues[Category.esneklik]!;
    var s = fuzzyValues[Category.sosyal]!;
    var d = fuzzyValues[Category.disiplin]!;

    // Örnek Kurallar
    addRule(_min(e['high']!, s['high']!, d['high']!), 95); // Süper uyumlu
    addRule(_min(e['low']!, s['low']!, d['low']!), 20); // Uyumsuz
    addRule(_min(e['mid']!, s['mid']!, d['mid']!), 60); // Dengeli
    addRule(_min(e['high']!, s['high']!, d['low']!), 65); // Uyumlu ama düzensiz
    addRule(
      _min(e['low']!, s['mid']!, d['high']!),
      50,
    ); // Teknik/Disiplinli ama sert

    return totalWeight > 0 ? weightedSum / totalWeight : 50.0;
  }

  static double _min(double a, double b, double c) => [a, b, c].reduce(min);
}
