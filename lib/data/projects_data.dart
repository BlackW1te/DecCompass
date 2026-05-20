class ProjectModel {
  final String title;
  final String categoryTitle;
  final String description;
  final String level; // 'Başlangıç', 'Orta', 'İleri'
  final List<String> tags;

  const ProjectModel({
    required this.title,
    required this.categoryTitle,
    required this.description,
    required this.level,
    required this.tags,
  });
}

const List<ProjectModel> projectsList = [
  // 1. Siber Güvenlik
  ProjectModel(
    title: 'Ağ Tarayıcı Scripti',
    categoryTitle: 'Siber Güvenlik',
    description: 'Python ve Scapy kullanarak ağdaki aktif cihazları ve açık portları listeleyen bir araç yap.',
    level: 'Başlangıç',
    tags: ['Python', 'Scapy', 'Network'],
  ),
  ProjectModel(
    title: 'Parola Gücü Analizörü',
    categoryTitle: 'Siber Güvenlik',
    description: 'Kullanıcının girdiği parolanın karmaşıklığını ölçen ve zayıflıkları raporlayan bir tool geliştir.',
    level: 'Başlangıç',
    tags: ['Python', 'Security', 'Regex'],
  ),
  ProjectModel(
    title: 'Basit Keylogger (Eğitim Amaçlı)',
    categoryTitle: 'Siber Güvenlik',
    description: 'Tuş vuruşlarını kaydeden ve belirli aralıklarla e-posta gönderen bir yazılım hazırla.',
    level: 'Başlangıç',
    tags: ['Python', 'Keylogger', 'SMTP'],
  ),
  ProjectModel(
    title: 'Zafiyetli Web Uygulaması',
    categoryTitle: 'Siber Güvenlik',
    description: 'Diğer geliştiricilerin sızma testi yapabilmesi için bilerek açık (SQLi, XSS) bırakılmış bir site tasarla.',
    level: 'Orta',
    tags: ['Web', 'OWASP 10', 'PHP/Node'],
  ),
  ProjectModel(
    title: 'Intrusion Detection System (IDS) Kurulumu',
    categoryTitle: 'Siber Güvenlik',
    description: 'Bir Raspberry Pi veya sanal makine üzerinde Snort kullanarak gerçek zamanlı ağ trafiği izle.',
    level: 'Orta',
    tags: ['Linux', 'Snort', 'IDS'],
  ),
  ProjectModel(
    title: 'Malware Analiz Laboratuvarı',
    categoryTitle: 'Siber Güvenlik',
    description: 'İzole bir ortamda gerçek bir fidye yazılımını (ransomware) analiz et ve davranış raporu oluştur.',
    level: 'İleri',
    tags: ['Malware', 'Reverse Eng', 'Sandbox'],
  ),
  ProjectModel(
    title: 'Kurumsal SIEM Dashboard',
    categoryTitle: 'Siber Güvenlik',
    description: 'Splunk üzerinde, bir ağdaki tüm giriş-çıkışları, başarısız login denemelerini ve şüpheli trafikleri gösteren canlı bir panel tasarla.',
    level: 'İleri',
    tags: ['SIEM', 'Splunk', 'Log Analysis'],
  ),

  // 2. Yapay Zeka ve Makine Öğrenmesi
  ProjectModel(
    title: 'Meyve/Sebze Sınıflandırıcı',
    categoryTitle: 'Yapay Zeka ve Makine Öğrenmesi',
    description: 'CNN kullanarak resimdeki meyvenin ne olduğunu söyleyen bir uygulama yap.',
    level: 'Başlangıç',
    tags: ['Python', 'CNN', 'TensorFlow'],
  ),
  ProjectModel(
    title: 'Emlak Fiyat Tahmincisi',
    categoryTitle: 'Yapay Zeka ve Makine Öğrenmesi',
    description: 'Geçmiş verilere bakarak evin özelliklerine göre fiyatını tahmin eden regresyon modeli kur.',
    level: 'Başlangıç',
    tags: ['Python', 'Regression', 'Pandas'],
  ),
  ProjectModel(
    title: 'Müşteri Segmentasyonu',
    categoryTitle: 'Yapay Zeka ve Makine Öğrenmesi',
    description: 'Bir marketin müşteri verilerini K-Means ile analiz edip alışveriş alışkanlıklarına göre grupla.',
    level: 'Başlangıç',
    tags: ['Python', 'K-Means', 'Clustering'],
  ),
  ProjectModel(
    title: 'Twitter Duygu Analizi',
    categoryTitle: 'Yapay Zeka ve Makine Öğrenmesi',
    description: 'Belirli bir hashtag altındaki tweetlerin olumlu mu olumsuz mu olduğunu anlık analiz et.',
    level: 'Orta',
    tags: ['NLP', 'Sentiment', 'Twitter API'],
  ),
  ProjectModel(
    title: 'YOLO ile Nesne Takibi',
    categoryTitle: 'Yapay Zeka ve Makine Öğrenmesi',
    description: 'Web kamerasından gerçek zamanlı olarak insanları, arabaları veya evcil hayvanları kutu içine alıp tanı.',
    level: 'Orta',
    tags: ['CV', 'YOLO', 'OpenCV'],
  ),
  ProjectModel(
    title: 'Kişisel Sağlık Asistanı (LLM)',
    categoryTitle: 'Yapay Zeka ve Makine Öğrenmesi',
    description: 'RAG (Retrieval-Augmented Generation) kullanarak tıbbi makalelerden beslenen bir soru-cevap botu yap.',
    level: 'İleri',
    tags: ['LLM', 'RAG', 'LangChain'],
  ),
  ProjectModel(
    title: 'Otonom Yarış Arabası',
    categoryTitle: 'Yapay Zeka ve Makine Öğrenmesi',
    description: 'Basit bir simülasyon ortamında Pekiştirmeli Öğrenme (RL) ile pistte kalmayı öğrenen bir araç eğit.',
    level: 'İleri',
    tags: ['RL', 'Simulation', 'PyTorch'],
  ),

  // 3. Veri Bilimi & Büyük Veri
  ProjectModel(
    title: 'Satış Dashboard\'u',
    categoryTitle: 'Veri Bilimi & Büyük Veri',
    description: 'Bir e-ticaret sitesinin CSV verilerini kullanarak Tableau\'da en çok satan ürünleri ve aylık ciroyu gösteren bir panel yap.',
    level: 'Başlangıç',
    tags: ['Tableau', 'Data Viz', 'Excel'],
  ),
  ProjectModel(
    title: 'Döviz/Kripto Veri Çekici',
    categoryTitle: 'Veri Bilimi & Büyük Veri',
    description: 'Python ile bir borsa sitesinden anlık fiyatları çekip veritabanına kaydeden bir script yaz.',
    level: 'Başlangıç',
    tags: ['Python', 'SQL', 'Web Scraping'],
  ),
  ProjectModel(
    title: 'IMDB Film Analizi',
    categoryTitle: 'Veri Bilimi & Büyük Veri',
    description: 'IMDB veri setini kullanarak en başarılı yönetmenleri ve türlerin yıllara göre popülerliğini analiz et.',
    level: 'Başlangıç',
    tags: ['Python', 'Pandas', 'Matplotlib'],
  ),
  ProjectModel(
    title: 'Hava Kirliliği İzleme Sistemi',
    categoryTitle: 'Veri Bilimi & Büyük Veri',
    description: 'Hava kalitesi sensörlerinden gelen verileri Apache Spark ile işleyip bölgelere göre kirlilik haritası çıkar.',
    level: 'Orta',
    tags: ['Spark', 'Big Data', 'IoT'],
  ),
  ProjectModel(
    title: 'Müşteri Terk (Churn) Analizi',
    categoryTitle: 'Veri Bilimi & Büyük Veri',
    description: 'Bir telekom şirketindeki hangi müşterilerin aboneliğini iptal edeceğini tahmin eden bir model geliştir.',
    level: 'Orta',
    tags: ['Machine Learning', 'Churn', 'Python'],
  ),
  ProjectModel(
    title: 'Gerçek Zamanlı Borsa Analiz Pipeline\'ı',
    categoryTitle: 'Veri Bilimi & Büyük Veri',
    description: 'Kafka ile gelen borsa verilerini Spark Streaming ile anlık işleyip, ani düşüşlerde uyarı veren bir sistem kur.',
    level: 'İleri',
    tags: ['Kafka', 'Spark Streaming', 'FinTech'],
  ),
  ProjectModel(
    title: 'Akıllı Şehir Veri Gölü',
    categoryTitle: 'Veri Bilimi & Büyük Veri',
    description: 'Trafik yoğunluğu, enerji tüketimi ve hava durumu verilerini birleştirerek şehrin yoğunluk haritasını çıkaran ve optimizasyon öneren bir sistem tasarla.',
    level: 'İleri',
    tags: ['Data Lake', 'Hadoop', 'Analytics'],
  ),

  // 4. DevOps Mühendisliği
  ProjectModel(
    title: 'Kişisel Blog Portfolyosu ve CI/CD',
    categoryTitle: 'DevOps Mühendisliği',
    description: 'Statik bir web sitesinin her kod güncellendiğinde otomatik olarak buluta yüklenmesi.',
    level: 'Başlangıç',
    tags: ['GitHub Actions', 'AWS S3', 'CI/CD'],
  ),
  ProjectModel(
    title: 'Dockerize Edilmiş Python API',
    categoryTitle: 'DevOps Mühendisliği',
    description: 'Bir Flask/FastAPI uygulamasının Docker konteyneri haline getirilip her ortamda çalışabilir kılınması.',
    level: 'Başlangıç',
    tags: ['Docker', 'Python', 'Compose'],
  ),
  ProjectModel(
    title: 'Sunucusuz (Serverless) Not Alma Uygulaması',
    categoryTitle: 'DevOps Mühendisliği',
    description: 'Sunucu yönetmeden sadece fonksiyonlar kullanarak çalışan bir web uygulaması.',
    level: 'Başlangıç',
    tags: ['AWS Lambda', 'DynamoDB', 'Serverless'],
  ),
  ProjectModel(
    title: 'Kubernetes Üzerinde Mikroservis Mimarisi',
    categoryTitle: 'DevOps Mühendisliği',
    description: 'Birbirinden bağımsız çalışan servislerin (Ödeme, Sepet, Ürün) Kubernetes üzerinde yönetilmesi.',
    level: 'İleri',
    tags: ['Kubernetes', 'Helm', 'Terraform'],
  ),

  // 5. Bulut Bilişim
  ProjectModel(
    title: 'Kişisel Blog Portfolyosu ve CI/CD',
    categoryTitle: 'Bulut Bilişim',
    description: 'Statik bir web sitesinin her kod güncellendiğinde otomatik olarak buluta yüklenmesi.',
    level: 'Başlangıç',
    tags: ['GitHub Actions', 'AWS S3', 'CI/CD'],
  ),
  ProjectModel(
    title: 'Dockerize Edilmiş Python API',
    categoryTitle: 'Bulut Bilişim',
    description: 'Bir Flask/FastAPI uygulamasının Docker konteyneri haline getirilip her ortamda çalışabilir kılınması.',
    level: 'Başlangıç',
    tags: ['Docker', 'Python', 'Compose'],
  ),
  ProjectModel(
    title: 'Sunucusuz (Serverless) Not Alma Uygulaması',
    categoryTitle: 'Bulut Bilişim',
    description: 'Sunucu yönetmeden sadece fonksiyonlar kullanarak çalışan bir web uygulaması.',
    level: 'Başlangıç',
    tags: ['AWS Lambda', 'DynamoDB', 'Serverless'],
  ),
  ProjectModel(
    title: 'Kubernetes Üzerinde Mikroservis Mimarisi',
    categoryTitle: 'Bulut Bilişim',
    description: 'Birbirinden bağımsız çalışan servislerin (Ödeme, Sepet, Ürün) Kubernetes üzerinde yönetilmesi.',
    level: 'İleri',
    tags: ['Kubernetes', 'Helm', 'Terraform'],
  ),

  // 6. Robotik ve Otomasyon
  ProjectModel(
    title: 'Engelden Kaçan Robot',
    categoryTitle: 'Robotik ve Otomasyon',
    description: 'Önündeki engelleri ultrasonik sensörle algılayıp çarpmadan yolunu bulan otonom araç.',
    level: 'Başlangıç',
    tags: ['Arduino', 'HC-SR04', 'Servo'],
  ),
  ProjectModel(
    title: 'Çizgi İzleyen Robot',
    categoryTitle: 'Robotik ve Otomasyon',
    description: 'Siyah bir çizgiyi kızılötesi sensörlerle takip eden, virajlarda savrulmayan klasik robotik projesi.',
    level: 'Başlangıç',
    tags: ['Arduino', 'PID', 'IR Sensor'],
  ),
  ProjectModel(
    title: 'Bluetooth Kontrollü Robot Kol (4 Eksen)',
    categoryTitle: 'Robotik ve Otomasyon',
    description: '4 adet servo motorun mobil uygulama üzerinden kontrol edildiği basit bir robotik kol.',
    level: 'Başlangıç',
    tags: ['Arduino', 'Servo', 'Bluetooth'],
  ),
  ProjectModel(
    title: 'Otonom Depo Robotu (SLAM & ROS2)',
    categoryTitle: 'Robotik ve Otomasyon',
    description: 'Lidar kullanarak harita çıkaran ve verilen hedefe en kısa yoldan giden otonom robot.',
    level: 'İleri',
    tags: ['ROS2', 'Lidar', 'SLAM'],
  ),

  // 7. Gömülü Sistemler ve IoT
  ProjectModel(
    title: 'Akıllı Hava İstasyonu',
    categoryTitle: 'Gömülü Sistemler ve IoT',
    description: 'Ortamdaki sıcaklık ve nem verilerini okuyup LCD ekran üzerinde gösteren ve eşik değer aşıldığında uyarı veren sistem.',
    level: 'Başlangıç',
    tags: ['ESP32', 'DHT11', 'LCD Screen'],
  ),
  ProjectModel(
    title: 'Akıllı Bitki Sulama Sistemi',
    categoryTitle: 'Gömülü Sistemler ve IoT',
    description: 'Toprak nemini ölçerek bitkinin suya ihtiyacı olup olmadığını anlayan ve pompayı otomatik çalıştıran sistem.',
    level: 'Başlangıç',
    tags: ['Arduino', 'Moisture Sensor', 'Relay'],
  ),
  ProjectModel(
    title: 'Bluetooth Kontrollü Akıllı Lamba',
    categoryTitle: 'Gömülü Sistemler ve IoT',
    description: 'Akıllı telefon üzerinden Bluetooth ile bağlanarak odadaki ışıkları açıp kapatabilen temel bir ev otomasyonu projesi.',
    level: 'Başlangıç',
    tags: ['HC-05', 'Relay', 'App Inventor'],
  ),
  ProjectModel(
    title: 'RFID ve Veritabanı Destekli Geçiş Sistemi',
    categoryTitle: 'Gömülü Sistemler ve IoT',
    description: 'Yetkili kartların tanındığı, giriş çıkış saatlerinin bir veritabanına (SQL veya Firebase) kaydedildiği kurumsal geçiş sistemi.',
    level: 'Orta',
    tags: ['RC522 RFID', 'ESP32', 'Firebase'],
  ),
  ProjectModel(
    title: 'IoT Tabanlı Enerji İzleme Paneli',
    categoryTitle: 'Gömülü Sistemler ve IoT',
    description: 'Evdeki elektrik tüketimini ölçen ve verileri MQTT protokolü üzerinden bir dashboard\'a aktaran sistem.',
    level: 'Orta',
    tags: ['ACS712', 'MQTT', 'Node-RED'],
  ),
  ProjectModel(
    title: 'Giyilebilir Sağlık Takip Cihazı (Saati)',
    categoryTitle: 'Gömülü Sistemler ve IoT',
    description: 'Nabız, kandaki oksijen ve adım sayısını ölçen, verileri mobil uygulamaya BLE (Bluetooth Low Energy) ile gönderen cihaz.',
    level: 'İleri',
    tags: ['nRF52840', 'BLE', 'OLED', 'Flutter'],
  ),
  ProjectModel(
    title: 'Endüstriyel Uç Bilişim Nesne Sayacı',
    categoryTitle: 'Gömülü Sistemler ve IoT',
    description: 'İnternet olmadan, cihaz üzerinde yapay zeka kullanarak konveyör banttaki ürünleri sayan ve hata tespiti yapan sistem.',
    level: 'İleri',
    tags: ['Raspberry Pi', 'TensorFlow Lite', 'OpenCV'],
  ),

  // 8. Sanal ve Artırılmış Gerçeklik (VR/AR)
  ProjectModel(
    title: 'Mobil AR Kartvizit',
    categoryTitle: 'Sanal ve Artırılmış Gerçeklik (VR/AR)',
    description: 'Fiziksel bir kartvizite telefonla bakıldığında, kişinin 3D modelinin, sosyal medya butonlarının ve portfolyosunun belirmesi.',
    level: 'Başlangıç',
    tags: ['Unity', 'Vuforia', 'AR'],
  ),
  ProjectModel(
    title: 'VR Fizik Laboratuvarı (Playground)',
    categoryTitle: 'Sanal ve Artırılmış Gerçeklik (VR/AR)',
    description: 'Yerçekimi, sürtünme ve çarpışma gibi fizik kurallarının VR gözlükle test edilebildiği basit bir oda.',
    level: 'Başlangıç',
    tags: ['Unity', 'XR Toolkit', 'VR'],
  ),
  ProjectModel(
    title: 'AR Mobilya Yerleştirme (Mini IKEA)',
    categoryTitle: 'Sanal ve Artırılmış Gerçeklik (VR/AR)',
    description: 'Telefon kamerasını kullanarak gerçek odaya 3D koltuk veya masa modelleri yerleştirme uygulaması.',
    level: 'Başlangıç',
    tags: ['AR Foundation', 'Unity', 'IKEA'],
  ),
  ProjectModel(
    title: 'VR Kaçış Odası (Escape Room)',
    categoryTitle: 'Sanal ve Artırılmış Gerçeklik (VR/AR)',
    description: 'İçerisinde karmaşık bulmacaların olduğu, sesli yönlendirmeli ve hikaye tabanlı bir VR macera oyunu.',
    level: 'İleri',
    tags: ['Unity', 'C#', 'Spatial Audio'],
  ),
  ProjectModel(
    title: 'AR Navigasyon ve Şehir Rehberi',
    categoryTitle: 'Sanal ve Artırılmış Gerçeklik (VR/AR)',
    description: 'Açık havada telefon kamerasını tuttuğunuz yerdeki binaların üzerine o bina hakkında bilgiler (restoran puanı, tarihçe vb.) getiren sistem.',
    level: 'İleri',
    tags: ['Unity', 'Mapbox SDK', 'GPS'],
  ),

  // 9. Dijital Adli Bilişim ve Kriptografi
  ProjectModel(
    title: 'Dosya Bütünlük Doğrulayıcı',
    categoryTitle: 'Dijital Adli Bilişim ve Kriptografi',
    description: 'İndirilen veya incelenen bir dosyanın değiştirilip değiştirilmediğini MD5, SHA-1 ve SHA-256 algoritmalarıyla kontrol eden araç.',
    level: 'Başlangıç',
    tags: ['Python', 'Hashlib', 'Forensics'],
  ),
  ProjectModel(
    title: 'Resim İçine Mesaj Gizleme (Steganografi)',
    categoryTitle: 'Dijital Adli Bilişim ve Kriptografi',
    description: 'Bir görselin piksellerine gizli metinler yerleştiren ve bu metni geri çözen bir araç.',
    level: 'Başlangıç',
    tags: ['Python', 'Stego', 'Pillow'],
  ),
  ProjectModel(
    title: 'EXIF Veri Çıkarıcı',
    categoryTitle: 'Dijital Adli Bilişim ve Kriptografi',
    description: 'Fotoğrafların içine gömülü olan konum (GPS), cihaz bilgisi ve tarih gibi adli bilişim açısından kritik bilgileri listeleyen araç.',
    level: 'Başlangıç',
    tags: ['Python', 'GPS', 'Metadata'],
  ),
  ProjectModel(
    title: 'Browser Forensics (Tarayıcı Analizcisi)',
    categoryTitle: 'Dijital Adli Bilişim ve Kriptografi',
    description: 'Chrome veya Firefox\'un geçmiş, çerez ve indirme kayıtlarını SQLite veritabanlarından çekip analiz eden bir araç.',
    level: 'Orta',
    tags: ['Browser', 'SQLite3', 'Forensics'],
  ),
  ProjectModel(
    title: 'RSA Tabanlı Güvenli Mesajlaşma',
    categoryTitle: 'Dijital Adli Bilişim ve Kriptografi',
    description: 'Asimetrik şifreleme kullanarak iki kişinin birbirine sadece birbirlerinin açabileceği şifreli mesajlar göndermesini sağlayan sistem.',
    level: 'Orta',
    tags: ['RSA', 'AES', 'Encryption'],
  ),

  // 10. Bilgisayar Ağları ve Sistem Yönetimi
  ProjectModel(
    title: 'Küçük Ofis Ağ Tasarımı (Simülasyon)',
    categoryTitle: 'Bilgisayar Ağları ve Sistem Yönetimi',
    description: 'Cisco Packet Tracer kullanarak bir şirketin iki farklı departmanı (İK ve Yazılım) için izole ağlar kurmak.',
    level: 'Başlangıç',
    tags: ['Packet Tracer', 'VLAN', 'Subnetting'],
  ),
  ProjectModel(
    title: 'Kişisel Ev Sunucusu ve Dosya Paylaşımı',
    categoryTitle: 'Bilgisayar Ağları ve Sistem Yönetimi',
    description: 'Eski bir laptopu veya Raspberry Pi\'yi kullanarak tüm ev halkının erişebileceği bir medya ve dosya sunucusu kurmak.',
    level: 'Başlangıç',
    tags: ['Ubuntu Server', 'Samba', 'SSH'],
  ),
  ProjectModel(
    title: 'Python ile Ağ Tarayıcı (Network Scanner)',
    categoryTitle: 'Bilgisayar Ağları ve Sistem Yönetimi',
    description: 'Ağdaki aktif cihazları ve bu cihazların açık portlarını tespit eden bir güvenlik aracı.',
    level: 'Başlangıç',
    tags: ['Python', 'Scapy', 'Network'],
  ),
  ProjectModel(
    title: 'Kurumsal İzleme ve Dashboard Sistemi',
    categoryTitle: 'Bilgisayar Ağları ve Sistem Yönetimi',
    description: 'Onlarca sunucunun ve ağ cihazının sağlık durumunu, CPU/RAM kullanımını ve trafik yoğunluğunu anlık olarak izleyen merkezi bir sistem.',
    level: 'İleri',
    tags: ['Prometheus', 'Grafana', 'SNMP', 'Docker'],
  ),

  // 11. Yazılım Mimarisi ve Proje Yönetimi
  ProjectModel(
    title: 'Katmanlı Mimari ile Kitaplık Yönetimi',
    categoryTitle: 'Yazılım Mimarisi ve Proje Yönetimi',
    description: 'Data-Business-UI katmanlarının kesin ayrıldığı temiz bir mimari uygulama.',
    level: 'Başlangıç',
    tags: ['Spring Boot/.NET', 'SQLite', 'SOLID'],
  ),
  ProjectModel(
    title: 'Merkezi Log (Kayıt) Servisi (API)',
    categoryTitle: 'Yazılım Mimarisi ve Proje Yönetimi',
    description: 'Farklı uygulamalardan gelen hataları toplayan merkezi bir servis.',
    level: 'Başlangıç',
    tags: ['FastAPI', 'MongoDB', 'JSON Log'],
  ),
  ProjectModel(
    title: 'Mikroservis Tabanlı Sepet ve Stok',
    categoryTitle: 'Yazılım Mimarisi ve Proje Yönetimi',
    description: 'Bağımsız servislerin mesaj kuyrukları üzerinden konuştuğu dağıtık sistem.',
    level: 'Orta',
    tags: ['Docker', 'RabbitMQ/Kafka', 'Redis'],
  ),
  ProjectModel(
    title: 'Event-Sourcing Bankacılık Sistemi',
    categoryTitle: 'Yazılım Mimarisi ve Proje Yönetimi',
    description: 'Tüm işlemlerin immutable log olarak tutulduğu finansal mimari.',
    level: 'İleri',
    tags: ['CQRS', 'Kafka', 'PostgreSQL'],
  ),

  // 12. Mobil Uygulama Geliştirme
  ProjectModel(
    title: 'Hava Durumu Uygulaması',
    categoryTitle: 'Mobil Uygulama Geliştirme',
    description: 'Kullanıcının konumuna veya aradığı şehre göre anlık hava durumu bilgilerini gösteren basit bir uygulama. Dış API entegrasyonu ve temel UI bileşenlerini öğretir.',
    level: 'Başlangıç',
    tags: ['Flutter', 'OpenWeather', 'Geolocator'],
  ),
  ProjectModel(
    title: 'Kişisel Yapılacaklar Listesi',
    categoryTitle: 'Mobil Uygulama Geliştirme',
    description: 'Görev ekleme, silme, tamamlama işlemlerini içeren klasik bir todo uygulaması. State yönetimi ve yerel veri saklama konularını pekiştirir.',
    level: 'Başlangıç',
    tags: ['Flutter', 'Hive', 'Provider'],
  ),
  ProjectModel(
    title: 'Hesap Makinesi',
    categoryTitle: 'Mobil Uygulama Geliştirme',
    description: 'Standart matematiksel işlemleri gerçekleştiren, temiz bir arayüze sahip hesap makinesi uygulaması. Widget düzeni ve event yönetimini öğretir.',
    level: 'Başlangıç',
    tags: ['Flutter', 'Dart', 'Calculator'],
  ),
  ProjectModel(
    title: 'Tarif & Yemek Uygulaması',
    categoryTitle: 'Mobil Uygulama Geliştirme',
    description: 'Kullanıcının tarif arayabileceği, kategorilere göre filtreleyebileceği, favorilere ekleyebileceği ve tarif detaylarını görebileceği tam özellikli bir uygulama.',
    level: 'Orta',
    tags: ['Flutter', 'Firebase', 'Riverpod'],
  ),
  ProjectModel(
    title: 'Anlık Mesajlaşma Uygulaması',
    categoryTitle: 'Mobil Uygulama Geliştirme',
    description: 'Kullanıcılar arasında anlık mesajlaşmayı sağlayan, sohbet listesi ve profil sayfası içeren uygulama. Firebase Realtime Database veya Firestore ile gerçek zamanlı deneyim sunar.',
    level: 'Orta',
    tags: ['Flutter', 'Firebase Auth', 'WebSockets'],
  ),
  ProjectModel(
    title: 'E-Ticaret Uygulaması',
    categoryTitle: 'Mobil Uygulama Geliştirme',
    description: 'Ürün listeleme, sepet yönetimi, ödeme entegrasyonu ve sipariş takibini içeren profesyonel düzeyde e-ticaret uygulaması. Gerçek iş mantığı ve güvenli ödeme akışı içerir.',
    level: 'İleri',
    tags: ['Flutter', 'Node.js', 'Stripe API'],
  ),
  ProjectModel(
    title: 'Fitness Takip & Koçluk Uygulaması',
    categoryTitle: 'Mobil Uygulama Geliştirme',
    description: 'Kullanıcının egzersiz geçmişini, kalori takibini ve kişiselleştirilmiş antrenman planlarını yöneten kapsamlı fitness uygulaması. Health API entegrasyonu ve veri görselleştirmesi içerir.',
    level: 'İleri',
    tags: ['Flutter', 'HealthKit', 'fl_chart'],
  ),

  // 13. Web Geliştirme (Full-Stack)
  ProjectModel(
    title: 'Kişisel Portföy Sitesi',
    categoryTitle: 'Web Geliştirme (Full-Stack)',
    description: 'Projelerini, yeteneklerini ve iletişim bilgilerini içeren kişisel portföy web sitesi. Temel HTML, CSS ve responsive tasarım becerilerini pekiştirir.',
    level: 'Başlangıç',
    tags: ['HTML5', 'CSS3', 'GitHub Pages'],
  ),
  ProjectModel(
    title: 'Film/Dizi Arama Uygulaması',
    categoryTitle: 'Web Geliştirme (Full-Stack)',
    description: 'TMDB API kullanarak film ve dizi arama, detay görüntüleme ve favorilere ekleme yapılabilen web uygulaması. Fetch API ve DOM manipülasyonunu öğretir.',
    level: 'Başlangıç',
    tags: ['JavaScript', 'TMDB API', 'localStorage'],
  ),
  ProjectModel(
    title: 'Haber Okuyucu Uygulaması',
    categoryTitle: 'Web Geliştirme (Full-Stack)',
    description: 'News API veya RSS feed kullanarak farklı kategorilerde haber listeleyen, okuma moduna geçilen basit bir haber okuyucu uygulaması.',
    level: 'Başlangıç',
    tags: ['React', 'News API', 'Infinite Scroll'],
  ),
  ProjectModel(
    title: 'Proje Yönetim Aracı (Trello Klonu)',
    categoryTitle: 'Web Geliştirme (Full-Stack)',
    description: 'Kullanıcıların proje panoları oluşturabileceği, görevleri sürükle-bırak ile taşıyabileceği ve ekip arkadaşlarını davet edebileceği Trello benzeri uygulama.',
    level: 'Orta',
    tags: ['Next.js', 'PostgreSQL', 'Drag & Drop'],
  ),
  ProjectModel(
    title: 'Blog Platformu',
    categoryTitle: 'Web Geliştirme (Full-Stack)',
    description: 'Kullanıcıların makale yazıp yayınlayabileceği, okuyucuların yorum yapabileceği tam işlevsel bir blog platformu. Markdown editör, etiket sistemi ve SEO desteği içerir.',
    level: 'Orta',
    tags: ['Next.js', 'MongoDB', 'Markdown Editor'],
  ),
  ProjectModel(
    title: 'SaaS Abonelik Platformu',
    categoryTitle: 'Web Geliştirme (Full-Stack)',
    description: 'Farklı abonelik planları sunan, Stripe ile ödeme alan, kullanıcı paneli ve admin dashboard\'u olan tam kapsamlı SaaS uygulaması. Gerçek bir ürün çıkarma deneyimi yaşatır.',
    level: 'İleri',
    tags: ['Next.js', 'Stripe', 'Multi-tenant'],
  ),
  ProjectModel(
    title: 'Gerçek Zamanlı İşbirliği Aracı',
    categoryTitle: 'Web Geliştirme (Full-Stack)',
    description: 'Birden fazla kullanıcının aynı anda belge düzenleyebildiği, değişikliklerin anında yansıdığı Google Docs benzeri işbirliği aracı. CRDT algoritmaları içerir.',
    level: 'İleri',
    tags: ['Socket.io', 'CRDT', 'Redis', 'Next.js'],
  ),

  // 14. Oyun Geliştirme
  ProjectModel(
    title: 'Flappy Bird Klonu',
    categoryTitle: 'Oyun Geliştirme',
    description: 'Klasik Flappy Bird oyununun Unity veya Godot ile yeniden yapımı. Fizik motoru, collider yönetimi, skor sistemi ve oyun döngüsü kavramlarını öğretir.',
    level: 'Başlangıç',
    tags: ['Unity', 'C#', '2D Physics'],
  ),
  ProjectModel(
    title: '2D Platform Oyunu',
    categoryTitle: 'Oyun Geliştirme',
    description: 'Koşma, zıplama ve engelleri aşmayı içeren klasik 2D platform oyunu. Karakter animasyonları, düşmanlar ve basit level tasarımını öğretir.',
    level: 'Başlangıç',
    tags: ['Unity', 'Tilemap', '2D Character'],
  ),
  ProjectModel(
    title: 'Hafıza (Memory) Kartı Oyunu',
    categoryTitle: 'Oyun Geliştirme',
    description: 'Eşleşen kart çiftlerini bulmaya dayanan klasik hafıza oyunu. Kart çevirme animasyonu, zamanlayıcı ve skor hesaplama mekanikleri içerir.',
    level: 'Başlangıç',
    tags: ['Unity', 'UI Toolkit', 'Memory Game'],
  ),
  ProjectModel(
    title: 'Top-Down Shooter (Atıcı)',
    categoryTitle: 'Oyun Geliştirme',
    description: 'Yukarıdan bakış açısıyla oynanan, dalga dalga gelen düşmanları yok etmeye dayanan hayatta kalma oyunu. Silah sistemi, mermi yönetimi ve gelişen zorluk eğrisi içerir.',
    level: 'Orta',
    tags: ['Unity', 'NavMesh', 'Object Pool'],
  ),
  ProjectModel(
    title: 'Puzzle / Bulmaca Oyunu',
    categoryTitle: 'Oyun Geliştirme',
    description: 'Fizik tabanlı veya mantık bulmacaları içeren, birden fazla bölümü olan ve seviye editörü barındıran bulmaca oyunu. Oyun tasarımı ve seviye akışı konularını derinleştirir.',
    level: 'Orta',
    tags: ['Unity', 'JSON Levels', 'DOTween'],
  ),
  ProjectModel(
    title: '3D Açık Dünya RPG (Mini)',
    categoryTitle: 'Oyun Geliştirme',
    description: 'Keşfedilebilir bir açık dünya, görev sistemi, envanter yönetimi ve gerçek zamanlı savaş içeren RPG oyunu. Kapsamlı sistem mimarisini ve oyun ekonomisini öğretir.',
    level: 'İleri',
    tags: ['Unity', '3D RPG', 'Behavior Trees'],
  ),
  ProjectModel(
    title: 'Çok Oyunculu Online Oyun',
    categoryTitle: 'Oyun Geliştirme',
    description: 'Gerçek zamanlı çok oyunculu deneyim sunan, eşleştirme sistemi, lag telafisi ve oda yönetimini içeren online oyun. Ağ programlama ve client-server mimarisini öğretir.',
    level: 'İleri',
    tags: ['Netcode', 'Relay', 'Multiplayer'],
  ),
];
