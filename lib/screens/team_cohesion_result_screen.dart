import 'package:flutter/material.dart';
import '../models/team_cohesion_fuzzy_result_model.dart';

class TeamCohesionResultScreen extends StatelessWidget {
  final double score;

  const TeamCohesionResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final profile = FuzzyResultProfile.getProfile(score);

    return Scaffold(
      backgroundColor: const Color(
        0xFF0F172A,
      ), // Uygulamanın genel koyu temasına uygun arka plan
      appBar: AppBar(
        title: const Text(
          "Test Sonucu",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
        ),
        backgroundColor: Colors.transparent, // Modern görünüm için şeffaf
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Geri tuşunu beyaz yapar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Takım Uyumluluk Skoru",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              // Skor Göstergesi
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: CircularProgressIndicator(
                      value: score / 100,
                      strokeWidth: 14,
                      backgroundColor: Colors.white.withOpacity(
                        0.05,
                      ), // Koyu temaya uygun silik arka plan
                      valueColor: AlwaysStoppedAnimation<Color>(profile.color),
                      strokeCap: StrokeCap.round, // Kenarları yumuşatılmış bar
                    ),
                  ),
                  Text(
                    "%${score.toStringAsFixed(1)}",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Text(
                profile.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: profile.color,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                profile.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: profile.color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ), // Daha modern köşeli buton
                  elevation: 8,
                  shadowColor: profile.color.withOpacity(0.5),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Ana Sayfaya Dön",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
