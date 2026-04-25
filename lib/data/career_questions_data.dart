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

List<CareerQuestion> careerTestQuestions = [
  CareerQuestion(
    text:
        "1. Yeni bir teknoloji projesine başlarken seni en çok ne heyecanlandırır?",
    optionA:
        "İnsanların hayatını kolaylaştıracak şık ve hızlı bir uygulama/site inşa etmek.",
    optionB:
        "Kimsenin çözemediği karmaşık bir veri yığınından anlamlı tahminler çıkarmak.",
    pointsA: {"Web Geliştirme (Full-Stack)": 2, "Mobil Uygulama Geliştirme": 2},
    pointsB: {
      "Yapay Zeka ve Makine Öğrenmesi": 2,
      "Veri Bilimi ve Büyük Veri": 2,
    },
  ),
  CareerQuestion(
    text: "2. Bir 'Akıllı Şehir' projesinde hangi görevi üstlenmek istersin?",
    optionA:
        "Sokak lambalarının ve trafik sensörlerinin iletişim kurmasını sağlayan devreleri tasarlamak.",
    optionB:
        "Şehrin tüm teknolojik altyapısını bulut üzerinde toplamak ve kesintisiz çalışmasını sağlamak.",
    pointsA: {"Gömülü Sistemler ve IoT": 2, "Robotik ve Otomasyon": 2},
    pointsB: {
      "Bulut Bilişim ve DevOps": 2,
      "Bilgisayar Ağları ve Sistem Yönetimi": 2,
    },
  ),
  CareerQuestion(
    text: "3. Bir siber saldırı ihbarı aldığında ilk refleksin ne olur?",
    optionA:
        "Saldırganın içeri nasıl sızdığını bulmak için dijital izleri sürüp şifreleri analiz etmek.",
    optionB:
        "Gelecekteki saldırıları önlemek için sistemin savunma duvarlarını ve mimarisini yeniden kurgulamak.",
    pointsA: {"Dijital Adli Bilişim ve Kriptografi": 2, "Siber Güvenlik": 1},
    pointsB: {"Siber Güvenlik": 2, "Yazılım Mimarisi ve Proje Yönetimi": 1},
  ),
  CareerQuestion(
    text:
        "4. Bilgisayar ekranındaki görüntülerin gerçekçiliği senin için ne kadar önemli?",
    optionA:
        "Fizik kurallarına uygun, büyüleyici bir oyun dünyası veya simülasyon yaratmak benim işim.",
    optionB:
        "Gerçek dünyanın üzerine dijital bilgiler ekleyerek yeni bir deneyim sunmak.",
    pointsA: {
      "Oyun Geliştirme ve Grafik Programlama": 2,
      "Sanal ve Arttırılmış Gerçeklik (VR/AR)": 1,
    },
    pointsB: {
      "Sanal ve Arttırılmış Gerçeklik (VR/AR)": 2,
      "Mobil Uygulama Geliştirme": 1,
    },
  ),
  CareerQuestion(
    text:
        "5. Bir bankanın işlem kayıtlarını yönetiyor olsan hangi yapıya güvenirsin?",
    optionA:
        "Merkezi olmayan, şeffaf ve geriye dönük değiştirilemez bir kayıt defteri sistemi.",
    optionB:
        "Saniyede milyonlarca işlemi işleyebilen, yüksek performanslı devasa bir veritabanı.",
    pointsA: {
      "Blokzincir Teknolojileri": 2,
      "Dijital Adli Bilişim ve Kriptografi": 1,
    },
    pointsB: {
      "Veri Bilimi ve Büyük Veri": 2,
      "Yazılım Mimarisi ve Proje Yönetimi": 1,
    },
  ),
  CareerQuestion(
    text: "6. Boş vaktinde bir cihazın içini açtığında neyi merak edersin?",
    optionA:
        "İşlemcinin içindeki veri yollarının ve çiplerin fiziksel olarak nasıl dizildiğini.",
    optionB:
        "O donanımı hareket ettiren, motorları kontrol eden düşük seviyeli yazılım kodlarını.",
    pointsA: {
      "Donanım ve Mikroişlemci Tasarımı": 2,
      "Gömülü Sistemler ve IoT": 1,
    },
    pointsB: {"Robotik ve Otomasyon": 2, "Gömülü Sistemler ve IoT": 1},
  ),
  CareerQuestion(
    text:
        "7. Bir şirkette 'Yönetici' ruhun ağır basıyorsa hangi problem seni cezbeder?",
    optionA:
        "Bir yazılımın fikir aşamasından yayına alınmasına kadar geçen tüm süreci koordine etmek.",
    optionB:
        "Şirketin tüm ağ güvenliğini, sunucu erişimlerini ve IT politikasını baştan aşağı düzenlemek.",
    pointsA: {
      "Yazılım Mimarisi ve Proje Yönetimi": 2,
      "Bulut Bilişim ve DevOps": 1,
    },
    pointsB: {"Bilgisayar Ağları ve Sistem Yönetimi": 2, "Siber Güvenlik": 1},
  ),
  CareerQuestion(
    text:
        "8. Bir robotun dünyayı 'görmesini' sağlamak için hangisine odaklanırsın?",
    optionA:
        "Kameradan gelen görüntüleri saniyeler içinde analiz eden derin öğrenme algoritmalarına.",
    optionB:
        "Görüntü işleme teknolojilerini kullanarak objelerin 3D dünyadaki koordinatlarını hesaplamaya.",
    pointsA: {"Yapay Zeka ve Makine Öğrenmesi": 2, "Robotik ve Otomasyon": 1},
    pointsB: {
      "Oyun Geliştirme ve Grafik Programlama": 1,
      "Sanal ve Arttırılmış Gerçeklik (VR/AR)": 2,
    },
  ),
  CareerQuestion(
    text: "9. Uygulama geliştirirken 'hız' mı yoksa 'güvenlik' mi?",
    optionA:
        "Uygulama çok hızlı güncellenmeli; otomatik testlerden geçip hemen yayına alınmalı.",
    optionB:
        "Uygulama ne kadar hızlı olursa olsun, içindeki her bir satır kod güvenlik süzgecinden geçmeli.",
    pointsA: {"Bulut Bilişim ve DevOps": 2, "Web Geliştirme (Full-Stack)": 1},
    pointsB: {"Siber Güvenlik": 2, "Yazılım Mimarisi ve Proje Yönetimi": 1},
  ),
  CareerQuestion(
    text: "10. Verilerle uğraşırken seni en çok ne tatmin eder?",
    optionA:
        "Milyarlarca satır veriyi depolayacak devasa sistemleri tasarlamak ve yönetmek.",
    optionB:
        "O verileri kullanarak gelecekteki bir borsa hareketini veya kullanıcı davranışını tahmin etmek.",
    pointsA: {
      "Veri Bilimi ve Büyük Veri": 2,
      "Bilgisayar Ağları ve Sistem Yönetimi": 1,
    },
    pointsB: {
      "Yapay Zeka ve Makine Öğrenmesi": 2,
      "Veri Bilimi ve Büyük Veri": 1,
    },
  ),
];
