class TechnicalTestQuestion {
  final String id;
  final String category;
  final String questionType;
  final String difficulty;
  final double weight;
  final String question;
  final List<String> options;
  final String correctAnswer;
  final int correctIndex;
  final String explanation;
  final List<String> sourceTerms;
  final String roadmapTriggerIfWrong;
  final String subTopic;
  final List<String> sourceReferences;
  final String profileMetric;

  const TechnicalTestQuestion({
    required this.id,
    required this.category,
    required this.questionType,
    required this.difficulty,
    required this.weight,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.correctIndex,
    required this.explanation,
    required this.sourceTerms,
    required this.roadmapTriggerIfWrong,
    required this.subTopic,
    required this.sourceReferences,
    required this.profileMetric,
  });

  factory TechnicalTestQuestion.fromJson(Map<String, dynamic> json) {
    return TechnicalTestQuestion(
      id: (json['id'] ?? '').toString(),
      category: (json['category'] ?? '').toString(),
      questionType: (json['questionType'] ?? '').toString(),
      difficulty: (json['difficulty'] ?? '').toString(),
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      question: (json['question'] ?? '').toString(),
      options: (json['options'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(growable: false),
      correctAnswer: (json['correctAnswer'] ?? '').toString(),
      correctIndex: (json['correctIndex'] as num?)?.toInt() ?? -1,
      explanation: (json['explanation'] ?? '').toString(),
      sourceTerms: (json['sourceTerms'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(growable: false),
      roadmapTriggerIfWrong: (json['roadmapTriggerIfWrong'] ?? '').toString(),
      subTopic: (json['subTopic'] ?? '').toString(),
      sourceReferences: (json['sourceReferences'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(growable: false),
      profileMetric: (json['profileMetric'] ?? '').toString(),
    );
  }

  bool get isValid =>
      id.isNotEmpty &&
      question.isNotEmpty &&
      options.length >= 2 &&
      correctIndex >= 0 &&
      correctIndex < options.length;
}
