enum Category { esneklik, sosyal, disiplin }

class Question {
  final String text;
  final Category category;
  double score;

  Question({
    required this.text,
    required this.category,
    this.score = 0.0, // <-- Burayı 3.0'dan 0.0'a çevirdik
  });

  // Eğer copy metodunu eklediysen onu da güncelle:
  Question copy() {
    return Question(
      text: this.text,
      category: this.category,
      score: 0.0, // <-- Burası da 0.0 olmalı
    );
  }
}
