import 'package:flutter/material.dart';

import '../models/technical_test_result.dart';

class TechnicalTestResultScreen extends StatelessWidget {
  final String title;
  final TechnicalTestResult result;

  const TechnicalTestResultScreen({
    super.key,
    required this.title,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Text(
                result.profile.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: result.profile.color,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                result.profile.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, height: 1.5),
              ),
              const SizedBox(height: 28),
              _ScoreCard(result: result),
              const SizedBox(height: 18),
              _CategoryList(result: result),
              const SizedBox(height: 18),
              if (result.weakCategories.isNotEmpty)
                Text(
                  'Öneri: ${result.weakCategories.join(', ')} alanlarını güçlendirebilirsin.',
                  style: const TextStyle(color: Color(0xFFFBBF24), fontWeight: FontWeight.w700),
                ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: result.profile.color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Ana Sayfaya Dön', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({required this.result});

  final TechnicalTestResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: result.score / 100,
                  strokeWidth: 14,
                  backgroundColor: Colors.white.withValues(alpha: 0.06),
                  valueColor: AlwaysStoppedAnimation<Color>(result.profile.color),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(
                '%${result.score.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '${result.correctCount} / ${result.totalCount} doğru',
            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({required this.result});

  final TechnicalTestResult result;

  @override
  Widget build(BuildContext context) {
    final entries = result.categoryScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kategori Skorları', style: TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          ...entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.key,
                      style: const TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ),
                  Text('%${entry.value.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
