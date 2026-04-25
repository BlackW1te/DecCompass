import 'technical_test_question.dart';

class TechnicalTestMetadata {
  final String title;
  final String purpose;
  final String version;
  final String language;
  final int totalQuestions;
  final int questionsPerCategory;
  final List<String> categories;
  final Map<String, double> difficultyWeights;

  const TechnicalTestMetadata({
    required this.title,
    required this.purpose,
    required this.version,
    required this.language,
    required this.totalQuestions,
    required this.questionsPerCategory,
    required this.categories,
    required this.difficultyWeights,
  });

  factory TechnicalTestMetadata.fromJson(Map<String, dynamic> json) {
    return TechnicalTestMetadata(
      title: (json['title'] ?? '').toString(),
      purpose: (json['purpose'] ?? '').toString(),
      version: (json['version'] ?? '').toString(),
      language: (json['language'] ?? '').toString(),
      totalQuestions: (json['totalQuestions'] as num?)?.toInt() ?? 0,
      questionsPerCategory: (json['questionsPerCategory'] as num?)?.toInt() ?? 0,
      categories: (json['categories'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(growable: false),
      difficultyWeights: Map<String, double>.from(
        (json['difficultyWeights'] as Map? ?? const {}).map(
          (key, value) => MapEntry(key.toString(), (value as num).toDouble()),
        ),
      ),
    );
  }
}

class TechnicalTestSet {
  final TechnicalTestMetadata metadata;
  final List<TechnicalTestQuestion> questions;

  const TechnicalTestSet({required this.metadata, required this.questions});

  factory TechnicalTestSet.fromJson(Map<String, dynamic> json) {
    final metadata = TechnicalTestMetadata.fromJson(
      Map<String, dynamic>.from(json['metadata'] as Map? ?? const {}),
    );
    final questions = (json['questions'] as List<dynamic>? ?? const [])
        .whereType<Map>()
        .map((item) => TechnicalTestQuestion.fromJson(Map<String, dynamic>.from(item)))
        .where((question) => question.isValid)
        .toList(growable: false);

    return TechnicalTestSet(metadata: metadata, questions: questions);
  }

  List<TechnicalTestQuestion> byCategory(String? category) {
    if (category == null || category.isEmpty) {
      return questions;
    }
    return questions.where((question) => question.category == category).toList(growable: false);
  }
}
