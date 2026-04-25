import 'package:flutter/material.dart';
import '../data/team_cohesion_questions_data.dart';
import '../models/team_cohesion_question_model.dart';
import '../services/team_cohesion_fuzzy_engine.dart';
import 'team_cohesion_result_screen.dart';

// Sınıf ismini HomeScreen ile uyumlu hale getirdik
class TeamCohesionTestScreen extends StatefulWidget {
  const TeamCohesionTestScreen({super.key});

  @override
  _TeamCohesionTestScreenState createState() => _TeamCohesionTestScreenState();
}

class _TeamCohesionTestScreenState extends State<TeamCohesionTestScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _finishTest() {
    Map<Category, List<double>> scoreMap = {
      Category.esneklik: [],
      Category.sosyal: [],
      Category.disiplin: [],
    };

    for (var q in teamQuestions) {
      scoreMap[q.category]!.add(q.score);
    }

    Map<Category, double> averages = {
      Category.esneklik:
          scoreMap[Category.esneklik]!.reduce((a, b) => a + b) / 8,
      Category.sosyal: scoreMap[Category.sosyal]!.reduce((a, b) => a + b) / 8,
      Category.disiplin:
          scoreMap[Category.disiplin]!.reduce((a, b) => a + b) / 8,
    };

    double finalResult = TeamCohesionFuzzyEngine.calculate(averages);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // Buradaki ResultScreen ismini de diğer dosyada güncellediysen dikkat et
        builder: (context) => TeamCohesionResultScreen(score: finalResult),
      ),
    );
  }

  void _nextPage() {
    if (_currentIndex < teamQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishTest();
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIndex + 1) / teamQuestions.length;

    return Scaffold(
      backgroundColor: const Color(
        0xFF0F172A,
      ), // Senin uygulamanın koyu temasına uygun
      appBar: AppBar(
        title: const Text(
          "Takım Uyumluluk Testi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white10,
            valueColor: const AlwaysStoppedAnimation(Color(0xFF34D399)),
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemCount: teamQuestions.length,
        itemBuilder: (context, index) {
          final question = teamQuestions[index];
          return _buildQuestionPage(question);
        },
      ),
    );
  }

  Widget _buildQuestionPage(Question question) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SORU ${_currentIndex + 1} / ${teamQuestions.length}",
            style: const TextStyle(
              color: Color(0xFF34D399),
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            question.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 48),
          ...List.generate(5, (index) {
            List<String> labels = [
              "Hiç Katılmıyorum",
              "Katılmıyorum",
              "Kararsızım",
              "Katılıyorum",
              "Tamamen Katılıyorum",
            ];
            double val = index + 1.0;
            bool isSelected = question.score == val;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Color(0xFF34D399), Color(0xFF10B981)],
                        )
                      : null,
                  color: isSelected ? null : Colors.white.withOpacity(0.05),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    setState(() => question.score = val);
                    Future.delayed(
                      const Duration(milliseconds: 250),
                      _nextPage,
                    );
                  },
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white70,
                      fontWeight: isSelected
                          ? FontWeight.w900
                          : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
