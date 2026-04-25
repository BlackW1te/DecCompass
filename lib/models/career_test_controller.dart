import 'package:shared_preferences/shared_preferences.dart';

class CareerTestController {
  // Puanların saklandığı map
  Map<String, int> scores = {
    "Siber Güvenlik": 0,
    "Yapay Zeka ve Makine Öğrenmesi": 0,
    "Veri Bilimi ve Büyük Veri": 0,
    "Mobil Uygulama Geliştirme": 0,
    "Web Geliştirme (Full-Stack)": 0,
    "Oyun Geliştirme ve Grafik Programlama": 0,
    "Gömülü Sistemler ve IoT": 0,
    "Robotik ve Otomasyon": 0,
    "Bulut Bilişim ve DevOps": 0,
    "Yazılım Mimarisi ve Proje Yönetimi": 0,
    "Blokzincir Teknolojileri": 0,
    "Donanım ve Mikroişlemci Tasarımı": 0,
    "Bilgisayar Ağları ve Sistem Yönetimi": 0,
    "Dijital Adli Bilişim ve Kriptografi": 0,
    "Sanal ve Arttırılmış Gerçeklik (VR/AR)": 0,
  };

  void updateScore(Map<String, int> points) {
    points.forEach((key, value) {
      if (scores.containsKey(key)) {
        scores[key] = (scores[key] ?? 0) + value;
      }
    });
  }

  String getBestMatch() {
    var sortedEntries = scores.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value));
    return sortedEntries.first.key;
  }

  // Sonucu cihaz hafızasına kaydet (Sonuçları tutmak için)
  Future<void> saveResult(String field) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('recommended_field', field);
  }
}
