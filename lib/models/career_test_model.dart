class CareerQuestion {
  final String text;
  final String optionA;
  final String optionB;
  final Map<String, int> pointsA;
  final Map<String, int> pointsB;

  CareerQuestion({
    required this.text,
    required this.optionA,
    required this.optionB,
    required this.pointsA,
    required this.pointsB,
  });
}
