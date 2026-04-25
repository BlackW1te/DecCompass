import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/career_questions_data.dart';

class CareerTestScreen extends StatefulWidget {
  const CareerTestScreen({super.key});

  @override
  State<CareerTestScreen> createState() => _CareerTestScreenState();
}

class _CareerTestScreenState extends State<CareerTestScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Tüm alanların skorlarını tutacağımız map
  Map<String, int> scores = {};

  void _answerQuestion(Map<String, int> points) {
    // Puanları ekle
    points.forEach((field, point) {
      scores[field] = (scores[field] ?? 0) + point;
    });

    // Sonraki soruya geç veya testi bitir
    if (_currentIndex < careerTestQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishTest();
    }
  }

  Future<void> _finishTest() async {
    // En yüksek puanlı alanı bul
    var sortedEntries = scores.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value));

    String bestField = sortedEntries.isNotEmpty
        ? sortedEntries.first.key
        : "Web Geliştirme (Full-Stack)";

    // Cihaz hafızasına kaydet
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('recommended_field', bestField);

    // Ana sayfaya geri dön (true değeri gönderiyoruz ki anasayfa yenilenmesi gerektiğini bilsin)
    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIndex + 1) / careerTestQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text(
          "Kariyer Yolculuğu Testi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white10,
            valueColor: const AlwaysStoppedAnimation(
              Color(0xFFA855F7),
            ), // Mor tema
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Kaydırmayı kapat
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemCount: careerTestQuestions.length,
        itemBuilder: (context, index) {
          final question = careerTestQuestions[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SORU ${_currentIndex + 1} / 10",
                  style: const TextStyle(
                    color: Color(0xFFA855F7),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  question.text.substring(3), // Başındaki "1. " kısmını gizler
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                // A ŞIKKI
                _OptionButton(
                  text: question.optionA,
                  onTap: () => _answerQuestion(question.pointsA),
                ),
                const SizedBox(height: 16),
                // B ŞIKKI
                _OptionButton(
                  text: question.optionB,
                  onTap: () => _answerQuestion(question.pointsB),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Şıklar için özel tasarım buton
class _OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _OptionButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
