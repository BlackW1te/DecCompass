import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/technical_test_set.dart';

class TechnicalTestRepository {
  const TechnicalTestRepository();

  Future<TechnicalTestSet> loadFromAsset(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(raw);

    if (decoded is! Map) {
      throw FormatException('Test verisi beklenen JSON nesnesi değil.');
    }

    return TechnicalTestSet.fromJson(Map<String, dynamic>.from(decoded));
  }
}
