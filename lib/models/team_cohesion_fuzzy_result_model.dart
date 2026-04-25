import 'package:flutter/material.dart';

class FuzzyResultProfile {
  final String title;
  final String description;
  final Color color;
  final double minScore;

  FuzzyResultProfile({
    required this.title,
    required this.description,
    required this.color,
    required this.minScore,
  });

  // Skora göre uygun profili döndüren statik bir metod
  static FuzzyResultProfile getProfile(double score) {
    // Büyükten küçüğe kontrol ederek ilk eşleşeni döndürüyoruz
    if (score >= 85) {
      return FuzzyResultProfile(
        title: "Takım Katalizörü",
        description:
            "Sen bir ekibin birleştirici gücüsün. Hem yüksek disiplin hem de yüksek duygusal zeka ile ideal bir partnersin.",
        color: Colors.blueAccent,
        minScore: 85,
      );
    } else if (score >= 65) {
      return FuzzyResultProfile(
        title: "Güçlü İş Birlikçi",
        description:
            "Harika bir takım oyuncususun! İletişim becerilerin ve adaptasyon yeteneğin ekibi yukarı taşıyor.",
        color: Colors.green,
        minScore: 65,
      );
    } else if (score >= 35) {
      return FuzzyResultProfile(
        title: "Dengeli Destekçi",
        description:
            "Ekip uyumun iyi düzeyde. Hem kendi sorumluluklarını yerine getiriyor hem de gerektiğinde orta yolu bulabiliyorsun.",
        color: Colors.orangeAccent,
        minScore: 35,
      );
    } else {
      return FuzzyResultProfile(
        title: "Bireysel Odaklı",
        description:
            "Kendi başına çalışma temposunda daha verimli olan bir yapın var. Ekip içinde kendi bağımsız alanına ihtiyaç duyabilirsin.",
        color: Colors.redAccent,
        minScore: 0,
      );
    }
  }
}
