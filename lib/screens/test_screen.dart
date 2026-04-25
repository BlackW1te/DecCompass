import 'package:flutter/material.dart';

import '../models/technical_test_question.dart';
import '../models/technical_test_set.dart';
import '../services/technical_test_fuzzy_engine.dart';
import '../services/technical_test_repository.dart';
import 'technical_test_result_screen.dart';

class TestScreen extends StatefulWidget {
  final String title;
  final String assetPath;
  final String? categoryFilter;
  final int? questionLimit;

  const TestScreen({
    super.key,
    required this.title,
    required this.assetPath,
    this.categoryFilter,
    this.questionLimit,
  });

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final PageController _pageController = PageController();
  final TechnicalTestRepository _repository = const TechnicalTestRepository();
  late final Future<TechnicalTestSet> _testFuture;

  int _currentIndex = 0;
  final Map<String, int> _answers = {};

  @override
  void initState() {
    super.initState();
    _testFuture = _repository.loadFromAsset(widget.assetPath);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finishTest(
    List<TechnicalTestQuestion> questions,
    Map<String, double> difficultyWeights,
  ) async {
    final result = TechnicalTestFuzzyEngine.calculate(
      questions: questions,
      answers: _answers,
      difficultyWeights: difficultyWeights,
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TechnicalTestResultScreen(
          title: widget.title,
          result: result,
        ),
      ),
    );
  }

  void _nextPage(
    List<TechnicalTestQuestion> questions,
    Map<String, double> difficultyWeights,
  ) {
    if (_currentIndex < questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishTest(questions, difficultyWeights);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<TechnicalTestSet>(
        future: _testFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return _ErrorState(message: snapshot.error.toString());
          }

          final testSet = snapshot.data!;
          var questions = testSet.byCategory(widget.categoryFilter);
          final difficultyWeights = testSet.metadata.difficultyWeights;

          if (widget.questionLimit != null && widget.questionLimit! < questions.length) {
            questions = questions.take(widget.questionLimit!).toList(growable: false);
          }

          if (questions.isEmpty) {
            return const _ErrorState(message: 'Bu filtreye uygun soru bulunamadı.');
          }

          final progress = (_currentIndex + 1) / questions.length;

          return Column(
            children: [
              LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: Colors.white.withValues(alpha: 0.08),
                valueColor: const AlwaysStoppedAnimation(Color(0xFF34D399)),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) => setState(() => _currentIndex = index),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return _QuestionPage(
                      question: questions[index],
                      questionIndex: index,
                      totalQuestions: questions.length,
                      selectedIndex: _answers[questions[index].id],
                      onSelected: (selectedIndex) {
                        if (_answers.containsKey(questions[index].id)) {
                          return;
                        }

                        setState(() {
                          _answers[questions[index].id] = selectedIndex;
                        });

                        Future.delayed(const Duration(milliseconds: 220), () {
                          if (mounted) {
                            _nextPage(questions, difficultyWeights);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _QuestionPage extends StatelessWidget {
  final TechnicalTestQuestion question;
  final int questionIndex;
  final int totalQuestions;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const _QuestionPage({
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SORU ${questionIndex + 1} / $totalQuestions',
            style: const TextStyle(
              color: Color(0xFF34D399),
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            question.question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, height: 1.25),
          ),
          const SizedBox(height: 12),
          Text(
            '${question.category} • ${question.difficulty} • ağırlık ${question.weight.toStringAsFixed(1)}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 36),
          ...List.generate(question.options.length, (index) {
            final isSelected = selectedIndex == index;
            final label = String.fromCharCode(65 + index);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: isSelected
                      ? const LinearGradient(colors: [Color(0xFF34D399), Color(0xFF10B981)])
                      : null,
                  color: isSelected ? null : Colors.white.withValues(alpha: 0.05),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: selectedIndex == null ? () => onSelected(index) : null,
                  child: Row(
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white70,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          question.options[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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

class _ErrorState extends StatelessWidget {
  final String message;

  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
