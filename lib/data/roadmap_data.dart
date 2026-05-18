class RoadmapStep {
  final String title;
  final List<String> descriptions;

  const RoadmapStep({required this.title, required this.descriptions});
}

class RoadmapCategory {
  final String title;
  final List<RoadmapStep> steps;

  const RoadmapCategory({required this.title, required this.steps});
}

const List<RoadmapCategory> roadmapCategories = [
  RoadmapCategory(
    title: "Siber Güvenlik",
    steps: [
      RoadmapStep(
        title: "Adım 1: IT Temelleri & Ağ Güvenliği",
        descriptions: [
          "Ağ Protokollerini Öğren: OSI Modeli, TCP/IP, DNS, HTTP/S ve DHCP kavramlarını derinlemesine incele.",
          "Linux Terminal Hakimiyeti: Kali Linux veya Parrot OS kullanarak terminal komutlarında uzmanlaş.",
          "Ağ Analiz Araçları: Wireshark ile paket analizi yapmayı ve Nmap ile port taramayı öğren.",
          "Sanallaştırma: VMware veya VirtualBox üzerinde kendi laboratuvar ortamını kur.",
          "Temel Güvenlik Kavramları: CIA (Gizlilik, Bütünlük, Erişilebilirlik) üçlüsü ve tehdit modellerini kavra.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Ofansif Güvenlik (Sızma Testleri)",
        descriptions: [
          "Bilgi Toplama (Reconnaissance): Pasif ve aktif bilgi toplama tekniklerini (Shodan, Whois, Google Dorking) öğren.",
          "Web Zafiyetleri (OWASP Top 10): SQL Injection, XSS, CSRF ve IDOR gibi en yaygın açıkları pratik et.",
          "Exploitation Araçları: Metasploit Framework ve Burp Suite kullanarak zafiyet sömürmeyi öğren.",
          "Parola Saldırıları: Brute force, Dictionary attack ve Hash kırma (John the Ripper, Hashcat) yöntemlerini öğren.",
          "Sosyal Mühendislik: Phishing saldırıları ve insan faktörünün güvenlikteki rolünü analiz et.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Defansif Güvenlik & SOC Operasyonları",
        descriptions: [
          "SIEM Çözümleri: Splunk veya ELK Stack kullanarak log analizi ve olay izleme yapmayı öğren.",
          "Güvenlik Duvarı & IDS/IPS: Snort veya Suricata gibi saldırı tespit sistemlerini yapılandır.",
          "Endpoint Security: EDR çözümlerini ve zararlı yazılım tespit yöntemlerini incele.",
          "Incident Response: Bir saldırı anında izlenmesi gereken 'Preparation to Lessons Learned' adımlarını öğren.",
          "Adli Bilişim (Digital Forensics): Disk imajı alma ve silinen verileri kurtarma temellerini öğren.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Kriptografi & Kimlik Yönetimi",
        descriptions: [
          "Şifreleme Algoritmaları: Simetrik (AES) ve Asimetrik (RSA) şifreleme farklarını öğren.",
          "Hashing & Salting: Veri bütünlüğü için MD5, SHA-256 ve Bcrypt kullanımını kavra.",
          "SSL/TLS Protokolleri: Sertifika yönetimi ve güvenli bağlantı kurulumunu öğren.",
          "IAM (Identity & Access Management): OAuth 2.0, SAML ve Multi-Factor Authentication (MFA) yapılarını kur.",
          "VPN & Güvenli Tüneller: SSH tünelleme ve IPSec VPN yapılandırmasını öğren.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Bulut Güvenliği & Otomasyon",
        descriptions: [
          "Cloud Security (AWS/Azure): Bulut servislerindeki güvenlik yapılandırmalarını ve IAM kurallarını öğren.",
          "Python ile Güvenlik Otomasyonu: Kendi port tarayıcını veya zafiyet tespit scriptlerini yaz.",
          "DevSecOps: CI/CD süreçlerine güvenlik testlerini (SAST/DAST) entegre etmeyi öğren.",
          "Konteyner Güvenliği: Docker ve Kubernetes ortamlarında zafiyet taraması yap.",
          "Uyum ve Standartlar: ISO 27001, KVKK ve GDPR gibi yasal süreçler hakkında bilgi sahibi ol.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Yapay Zeka ve Makine Öğrenmesi",
    steps: [
      RoadmapStep(
        title: "Adım 1: Matematiksel Temeller & Python",
        descriptions: [
          "Lineer Cebir: Matrisler, vektörler ve tensör operasyonlarını öğren.",
          "İstatistik & Olasılık: Bayes teoremi, dağılımlar ve hipotez testlerine hakim ol.",
          "Calculus: Gradient Descent algoritmasını anlamak için türev ve zincir kuralını öğren.",
          "NumPy & Pandas: Büyük veri dizileri üzerinde hızlı işlem yapma ve veri manipülasyonu.",
          "Veri Görselleştirme: Matplotlib ve Seaborn ile verideki örüntüleri görselleştir.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Denetimli & Denetimsiz Öğrenme",
        descriptions: [
          "Regresyon Modelleri: Linear ve Logistic Regression ile tahminleme yap.",
          "Ağaç Tabanlı Modeller: Decision Trees, Random Forest ve XGBoost algoritmalarını öğren.",
          "Kümeleme (Clustering): K-Means ve Hierarchical Clustering ile veriyi gruplandır.",
          "Boyut Azaltma: PCA (Temel Bileşen Analizi) ile karmaşık verileri sadeleştir.",
          "Model Değerlendirme: Cross-validation, Confusion Matrix ve F1-Score metriklerini kullan.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Derin Öğrenme (Deep Learning)",
        descriptions: [
          "Yapay Sinir Ağları (ANN): Perceptron, aktivasyon fonksiyonları (ReLU, Sigmoid) ve Backpropagation.",
          "Frameworkler: PyTorch veya TensorFlow/Keras kütüphanelerinden birini seç ve uzmanlaş.",
          "CNN (Evrişimli Sinir Ağları): Görüntü tanıma, filtreleme ve pooling katmanlarını öğren.",
          "RNN & LSTM: Metin veya zaman serisi gibi ardışık verilerle çalışmayı öğren.",
          "Transfer Learning: Önceden eğitilmiş modelleri (ResNet, VGG) kendi projene uyarla.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: İleri Seviye Alanlar (NLP & CV)",
        descriptions: [
          "Doğal Dil İşleme (NLP): Tokenization, Word Embeddings (Word2Vec) ve Sentiment Analysis.",
          "Transformers & LLM: Attention mekanizması, BERT ve GPT mimarilerinin çalışma mantığını kavra.",
          "Bilgisayarlı Görü (CV): Nesne tespiti (YOLO), yüz tanıma ve görüntü segmentasyonu.",
          "Pekiştirmeli Öğrenme (RL): Agent, reward ve çevre etkileşimli öğrenme modellerini incele.",
          "Generative AI: GAN (Çekişmeli Üretici Ağlar) ile görüntü veya veri üretme.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: MLOps & Deployment",
        descriptions: [
          "Model Optimizasyonu: Hyperparameter tuning (Optuna/GridSearch) ve model sıkıştırma.",
          "API Deployment: Eğitilen modelleri FastAPI veya Flask ile bir web servisine dönüştür.",
          "Model Monitoring: Yayındaki modelin performansını (drift detection) takip etmeyi öğren.",
          "Docker & ML: ML modellerini taşınabilir konteynerlar haline getir.",
          "Cloud AI: AWS SageMaker veya Google Vertex AI gibi bulut platformlarını kullan.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Veri Bilimi & Büyük Veri",
    steps: [
      RoadmapStep(
        title: "Adım 1: Veri Analizi Temelleri & SQL",
        descriptions: [
          "İleri Seviye SQL: Karmaşık joinler, Window Functions ve Subqueries konusunda uzmanlaş.",
          "Veri Temizleme (Cleaning): Eksik verileri doldurma, aykırı değerleri (outlier) temizleme teknikleri.",
          "Keşifsel Veri Analizi (EDA): Veri setinin istatistiksel özetini çıkarma ve korelasyonları bulma.",
          "Excel/Google Sheets: Profesyonel seviyede pivot tablolar ve veri analizi fonksiyonları.",
          "Veri Ambarı Kavramları: ETL (Extract, Transform, Load) süreçlerini ve veri modellemeyi öğren.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Görselleştirme & İş Zekası (BI)",
        descriptions: [
          "Tableau veya Power BI: Profesyonel raporlar ve interaktif dashboardlar oluşturmayı öğren.",
          "Görsel Tasarım Prensipleri: Hangi veri türü için hangi grafik tipinin kullanılacağını seç.",
          "Python Görselleştirme: Plotly veya Bokeh ile web tabanlı interaktif grafikler hazırla.",
          "Storytelling with Data: Analiz sonuçlarını teknik olmayan kişilere nasıl sunacağını öğren.",
          "Otomatik Raporlama: Veri güncellendiğinde raporların otomatik yenilenmesini sağla.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Büyük Veri (Big Data) Ekosistemi",
        descriptions: [
          "Hadoop Dağıtık Sistemler: HDFS ve MapReduce çalışma mantığını kavra.",
          "Apache Spark: PySpark kullanarak devasa veri setlerini saniyeler içinde işle.",
          "NoSQL Dünyası: MongoDB (Döküman), Cassandra (Sütun) ve Redis (Key-Value) yapılarını öğren.",
          "Veri Akışları (Streaming): Apache Kafka ile gerçek zamanlı veri akışlarını yönet.",
          "Dağıtık Depolama: Veri gölü (Data Lake) ve Veri ambarı (Data Warehouse) farklarını öğren.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Veri Mühendisliği & Pipeline Yönetimi",
        descriptions: [
          "Workflow Orchestration: Apache Airflow kullanarak veri görevlerini zamanla ve yönet.",
          "Veri Doğrulama: Data Quality testleri yazarak hatalı verinin sisteme girmesini engelle.",
          "API Geliştirme: Veri sonuçlarını diğer sistemlere sunmak için REST API'lar tasarla.",
          "Web Scraping: BeautifulSoup veya Selenium ile internetten otomatik veri çekme sistemleri kur.",
          "Cloud Data Tools: BigQuery (Google), Snowflake veya Redshift (AWS) üzerinde veri depola.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: İstatistiksel Analiz & Tahminleme",
        descriptions: [
          "Zaman Serisi Analizi: Mevsimsellik, trend analizi ve gelecek tahmini modelleri.",
          "A/B Testleri: İki farklı stratejinin verimliliğini bilimsel olarak karşılaştır.",
          "Öneri Sistemleri (RecSys): Collaborative Filtering ve Content-Based öneri algoritmaları.",
          "Nedensellik Analizi: Korelasyon ve nedensellik arasındaki farkı istatistiksel testlerle kanıtla.",
          "Uygulamalı Veri Bilimi: İş problemlerini (churn analizi, sahtekarlık tespiti) veri ile çöz.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "DevOps Mühendisliği",
    steps: [
      RoadmapStep(
        title: "Adım 1: Temel Sistem ve Komut Satırı Bilgisi",
        descriptions: [
          "Linux Hakimiyeti: Ubuntu veya CentOS üzerinde terminal komutlarını (ls, cd, grep, awk) su gibi öğrenmek.",
          "Kabuk Programlama (Shell Scripting): Bash scriptleri yazarak rutin işleri otomatize etmek.",
          "Networking Temelleri: SSH, DNS, HTTP/S ve IP katmanlarını DevOps perspektifiyle anlamak.",
          "Paket Yönetimi: APT, YUM veya Homebrew gibi paket yöneticilerini kullanmak.",
          "Vim/Nano: Terminal üzerinde hızlı dosya düzenleme becerisi edinmek.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Versiyon Kontrol Sistemleri (Git)",
        descriptions: [
          "Git Temelleri: Commit, push, pull, fetch gibi temel komutlarda uzmanlaşmak.",
          "Branch Stratejileri: GitFlow veya Trunk-based Development gibi ekip çalışma modellerini öğrenmek.",
          "Merge ve Rebase: Kod çakışmalarını (conflict) çözme ve temiz bir commit geçmişi tutma.",
          "Uzak Depolar: GitHub, GitLab veya Bitbucket üzerinde Pull Request (PR) süreçlerini yönetmek.",
          "Git Hooks: Kod commit edilmeden önce otomatik testler çalıştıran tetikleyiciler kurmak.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Konteyner Teknolojileri (Docker)",
        descriptions: [
          "Docker Mantığı: Sanal makine ile Konteyner arasındaki farkı ve 'benim bilgisayarımda çalışıyordu' sorununu nasıl çözdüğünü anlamak.",
          "Dockerfile Yazımı: Kendi uygulama imajlarını oluşturmak için optimize edilmiş Dockerfile hazırlamak.",
          "Docker Hub: İmajları depolamak ve hazır imajları (Nginx, Python, MySQL) çekip yapılandırmak.",
          "Docker Compose: Birden fazla konteyneri tek bir dosya ile ayağa kaldırmak.",
          "Konteyner Güvenliği: İmaj tarama ve yetkisiz kullanıcı çalıştırma gibi güvenlik önlemlerini öğrenmek.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: CI/CD Süreçleri ve Otomasyon",
        descriptions: [
          "CI/CD Kavramı: Sürekli Entegrasyon ve Sürekli Dağıtım felsefesini kavramak.",
          "Pipeline Araçları: Jenkins, GitHub Actions veya GitLab CI araçlarından birinde ilk boru hattını kurmak.",
          "Otomatik Test: Kod her değiştiğinde unit ve entegrasyon testlerinin otomatik çalışmasını sağlamak.",
          "Artifact Yönetimi: Derlenen kodların versiyonlu şekilde saklanması.",
          "Deployment Stratejileri: Blue-Green veya Canary deployment ile yazılımı hatasız yayına alma teknikleri.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Altyapı Kodlama (Infrastructure as Code - IaC)",
        descriptions: [
          "IaC Mantığı: Sunucuları elle kurmak yerine kodla (Terraform, Ansible) ayağa kaldırma fikrini öğrenmek.",
          "Ansible: Mevcut sunucuların konfigürasyonunu otomatize etmek.",
          "Terraform: Bulut üzerinde (AWS, Azure) ağ ve sunucu kaynaklarını kodla tanımlamak.",
          "Kubernetes (K8s) Giriş: Konteynerların orkestrasyonunu ve kendi kendini iyileştiren sistemleri keşfetmek.",
          "Gözlemlenebilirlik (Monitoring): Prometheus ve Grafana ile sistemin sağlığını anlık izlemek.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Bulut Bilişim",
    steps: [
      RoadmapStep(
        title: "Adım 1: Bulut Temelleri ve Servis Modelleri",
        descriptions: [
          "Bulut Çeşitleri: Public Cloud, Private Cloud ve Hybrid Cloud farklarını öğrenmek.",
          "Hizmet Modelleri: IaaS (Altyapı), PaaS (Platform) ve SaaS (Yazılım) modellerini örneklerle anlamak.",
          "Sanallaştırma: Hypervisor teknolojisinin fiziksel sunucuyu nasıl böldüğünü kavramak.",
          "Global Altyapı: Region (Bölge) ve Availability Zone kavramlarını öğrenmek.",
          "Ekonomik Model: CapEx yerine OpEx mantığına geçişi incelemek.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Temel Bulut Servisleri (Compute & Storage)",
        descriptions: [
          "Sanal Sunucular: AWS EC2 veya Azure VM gibi servislerle bulutta ilk sunucunu kurmak.",
          "Obje Depolama: AWS S3 gibi servislerle sınırsız veri saklama ve static web hosting yapma.",
          "Blok Depolama: Sunuculara takılan sanal diskleri (EBS) yönetmek.",
          "Auto-Scaling: Trafik arttığında sunucu sayısının otomatik artmasını yapılandırmak.",
          "Load Balancer: Gelen trafiği sunucular arasında dengeli dağıtmak.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Bulut Ağları ve Güvenlik",
        descriptions: [
          "VPC (Virtual Private Cloud): Bulut içinde kendine ait izole bir özel ağ oluşturmak.",
          "Subnetting: Genel (Public) ve Özel (Private) alt ağlar tasarlamak.",
          "IAM: Kullanıcılara 'en az yetki' prensibiyle erişim tanımlamak.",
          "Security Groups: Sunucu bazlı güvenlik duvarı (Firewall) kuralları yazmak.",
          "Cloud Security Best Practices: Şifreleme ve güvenli bağlantı (VPN) yöntemlerini uygulamak.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Sunucusuz Mimari (Serverless)",
        descriptions: [
          "FaaS (Function as a Service): AWS Lambda veya Azure Functions ile sadece kod yazıp gerisini buluta bırakmak.",
          "Event-Driven Mimari: Bir dosya yüklendiğinde veya veri değiştiğinde çalışan tetikleyiciler kurmak.",
          "API Gateway: Yazdığın fonksiyonları internete güvenli bir API olarak açmak.",
          "Serverless Veritabanları: DynamoDB veya CosmosDB gibi ölçeklenebilir veritabanlarını kullanmak.",
          "Maliyet Avantajı: Sadece kod çalıştığı süre boyunca ödeme yapma mantığını analiz etmek.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Bulut Operasyonları ve FinOps",
        descriptions: [
          "Loglama: CloudWatch veya CloudTrail ile buluttaki her hareketi kayıt altına almak.",
          "Maliyet Yönetimi (FinOps): Bulut faturasını düşürmek için kaynak optimizasyonu yapmak.",
          "Backup & Disaster Recovery: Verilerin farklı bölgelere yedeğini alıp felaket anında ayağa kalkma planı yapmak.",
          "Multi-Cloud Stratejisi: Tek bir bulut sağlayıcısına (Vendor Lock-in) bağımlı kalmamak için stratejiler.",
          "Sertifikasyon Hazırlığı: AWS Cloud Practitioner veya Azure Fundamentals gibi sertifikalara çalışmak.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Robotik ve Otomasyon",
    steps: [
      RoadmapStep(
        title: "Adım 1: Mekanik Tasarım ve Robot Kinematiği",
        descriptions: [
          "Teknik Resim ve CAD: SolidWorks, Fusion 360 veya FreeCAD kullanarak 3D modeller çizmeyi öğren.",
          "Statik ve Dinamik: Fizik kurallarını hatırla; robotun kendi ağırlığını taşıyıp taşıyamayacağını ve hareket halindeki kuvvetleri hesapla.",
          "Kinematik: Eklem açılarının robotun uç noktasını nereye götüreceğini bulmak için ileri ve ters kinematik denklemlerini kavra.",
          "Malzeme Bilgisi: Hangi parça için alüminyum, hangi parça için 3D yazıcıdan çıkan PLA veya karbon fiber kullanman gerektiğini öğren.",
          "Hızlı Prototipleme: 3D yazıcılar ve lazer kesim cihazlarını kullanarak tasarımlarını fiziksel objelere dönüştür.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Elektronik, Aktüatörler ve Güç Yönetimi",
        descriptions: [
          "Motor Teknolojileri: Servo motor (hassas açı), Step motor (hassas adım) ve DC motorların (hız) nerede kullanılacağını öğren.",
          "Sürücü Devreleri: Mikrodenetleyiciden gelen zayıf sinyalleri, motoru döndürecek yüksek güce çeviren motor sürücüleri (L298N, DRV8825) kullan.",
          "Güç Dağıtımı: Li-Po pillerin güvenli kullanımı, voltaj regülatörleri ve akım hesaplamaları ile robotun enerjisini yönet.",
          "Sensör Entegrasyonu: Ultrasonik (mesafe), IR (çizgi takibi) ve IMU (denge) sensörlerini devreye ekle.",
          "PCB Tasarımı: KiCad veya EasyEDA ile kendi baskı devre kartlarını tasarla.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Kontrol Teorisi ve Gömülü Yazılım",
        descriptions: [
          "PID Kontrol: Robotun sarsılmadan, hedef noktada tam durmasını sağlayan Proportional-Integral-Derivative algoritmasını öğren.",
          "Gerçek Zamanlı Programlama: C++ kullanarak mikrodenetleyiciler (STM32, ESP32) üzerinde gecikmesiz kod yazma becerisi edin.",
          "Mantıksal Karar Yapıları: Sensörden gelen veriye göre robotun tepkisini belirleyen durum makineleri (State Machines) kur.",
          "Haberleşme Protokolleri: Robotun iç birimlerinin birbiriyle konuşması için I2C, SPI ve CAN-bus protokollerini uygula.",
          "Endüstriyel Otomasyon (PLC): Fabrika tipi robotlar için Siemens veya Beckhoff gibi PLC sistemlerine giriş yap.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Algılama, Görü ve Çevre Tanıma",
        descriptions: [
          "Görüntü İşleme: OpenCV kütüphanesi ile renk takibi, nesne tanıma ve kenar belirleme algoritmalarını çalıştır.",
          "Lidar ve Derinlik Kameraları: Lidar kullanarak çevrenin 2D/3D haritalarını (Point Cloud) çıkarmayı öğren.",
          "Sensor Fusion: Farklı sensörlerden gelen verileri birleştirerek daha doğru konum tahmini yap (Kalman Filtresi).",
          "SLAM: Robotun bilinmeyen bir odada kendi haritasını çıkarıp nerede olduğunu bulmasını sağlayan mantığı kavra.",
          "Engelden Sakınma: Dinamik engelleri algılayıp rotayı anlık olarak yeniden hesapla.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: ROS2 ve Üst Seviye Robotik Zeka",
        descriptions: [
          "ROS2 (Robot Operating System): Robotun tüm yazılım paketlerini bir orkestra şefi gibi yöneten framework'ü öğren.",
          "Simülasyon Dünyası: Fiziksel robotu kırmadan önce Gazebo veya NVIDIA Isaac Sim gibi ortamlarda testlerini yap.",
          "Yol Planlama (Path Planning): A* (A-star) veya Dijkstra algoritmaları ile en kısa ve güvenli yolu hesaplat.",
          "Yapay Zeka ve RL: Robotun deneme yanılma yoluyla yürümesini sağlayan Takviyeli Öğrenme modellerine bak.",
          "Sürü Robotlar: Birden fazla robotun birbiriyle koordineli çalışmasını sağlayan haberleşme ağlarını kur.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Gömülü Sistemler ve IoT",
    steps: [
      RoadmapStep(
        title: "Adım 1: Elektronik Temelleri ve C Programlama",
        descriptions: [
          "Temel Devre Elemanları: Direnç, kondansatör, diyot ve transistörlerin görevlerini öğren.",
          "Devre Kanunları: Ohm Kanunu ve Kirchhoff Kanunları ile gerilim/akım hesaplamaları yap.",
          "C Programlama (Gömülü Odağı): Pointers (işaretçiler), Structs ve Bitwise işlemleri su gibi öğren.",
          "Şema Okuma: Devre şemalarını analiz etmeyi ve sembolleri tanımayı öğren.",
          "Simülasyon: Proteus veya Tinkercad gibi araçlarla fiziksel parçalara zarar vermeden devreler kur.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Mikrodenetleyici Mimarisi ve İlk Kodlar",
        descriptions: [
          "Donanım Birimleri: İşlemci çekirdeği, RAM, Flash bellek ve Register (yazmaç) mantığını kavra.",
          "GPIO Yönetimi: Bir pini giriş (buton) veya çıkış (LED) olarak ayarlamayı ve kontrol etmeyi öğren.",
          "Interrupts (Kesmeler): İşlemcinin normal akışını durdurup acil görevlere cevap vermesini sağla.",
          "Timers & PWM: Zamanlayıcıları kullanmayı ve sinyal genişlik modülasyonu (PWM) ile LED parlaklığı veya motor hızı ayarlamayı öğren.",
          "Geliştirme Kartları: Önce Arduino ile başla, ardından endüstri standartı STM32 veya Wi-Fi yetenekli ESP32 dünyasına geç.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Haberleşme Protokolleri ve Sensör Dünyası",
        descriptions: [
          "UART/Serial: İki cihaz arasındaki en temel seri haberleşme yöntemini öğren ve terminale veri yazdır.",
          "I2C ve SPI: LCD ekranlar, ivmeölçerler ve gelişmiş sensörlerin kullandığı bu iki ana protokolü dene.",
          "ADC ve DAC: Gerçek dünyadaki analog sinyalleri (sıcaklık, ışık) dijital veriye dönüştürmeyi öğren.",
          "Sensör Entegrasyonu: Mesafe, nem, sıcaklık ve hareket sensörlerinden veri okuyup anlamlandır.",
          "Motor Sürücüler: Step motor veya DC motorları sürerek yazılımın fiziksel bir harekete dönüşmesini izle.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Kablosuz Teknolojiler ve IoT Katmanı",
        descriptions: [
          "Wi-Fi ve Bluetooth (BLE): ESP32 gibi çiplerle yerel ağa bağlanmayı ve düşük enerjili Bluetooth ile telefonla konuşmayı öğren.",
          "LPWAN Teknolojileri: Uzun mesafeli haberleşme için LoRaWAN veya NB-IoT gibi teknolojilerin mantığını araştır.",
          "MQTT Protokolü: IoT dünyasının dili olan hafif ve hızlı mesajlaşma protokolü MQTT'yi kullanmayı öğren.",
          "HTTP ve JSON: Verileri web servislerine gönderirken kullanılan veri formatlarını ve API isteklerini kavra.",
          "IoT Güvenliği: Veriyi şifreleme ve güvenli bağlantı (TLS/SSL) yöntemlerine giriş yap.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Bulut Entegrasyonu, Veri Analizi ve RTOS",
        descriptions: [
          "IoT Platformları: ThingsBoard, Adafruit IO veya Blynk gibi platformlarda verilerini görselleştir.",
          "Bulut Servisleri: AWS IoT Core veya Azure IoT Hub gibi dev platformların temellerini öğren.",
          "RTOS (Real-Time Operating System): FreeRTOS gibi işletim sistemleri ile mikrodenetleyicide çoklu görev yönet.",
          "OTA (Over-the-Air) Updates: Cihazın yazılımını internet üzerinden uzaktan güncellemeyi öğren.",
          "Uç Bilişim (Edge Computing): Veriyi buluta göndermeden önce cihazın üzerinde basit kararlar vermesini sağla.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Sanal ve Artırılmış Gerçeklik (VR/AR)",
    steps: [
      RoadmapStep(
        title: "Adım 1: VR/AR Temelleri ve Cihaz Teknolojilerini Anlamak",
        descriptions: [
          "XR Kavramlarını Tanı: VR (Sanal Gerçeklik), AR (Artırılmış Gerçeklik) ve MR (Karma Gerçeklik) arasındaki farkları öğren.",
          "Optik ve Görüş Alanı (FOV): Lenslerin nasıl çalıştığını ve görüş açısının kullanıcı deneyimine etkisini incele.",
          "Takip Sistemleri (Tracking): 3DoF (sadece dönüş) ve 6DoF (dönüş + hareket) arasındaki farkı anla.",
          "Donanım Ekosistemi: Meta Quest (Standalone), HTC Vive (PCVR) ve HoloLens gibi cihazları araştır.",
          "İnsan Fizyolojisi: Hareket hastalığı (motion sickness) neden olur ve kare hızının (FPS) önemini kavra.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Oyun Motorları ve Yazılım Geliştirme",
        descriptions: [
          "Motor Seçimi: Unity (C# ile - başlangıç için önerilir) veya Unreal Engine (C++ ve Blueprint ile) arasından birine karar ver.",
          "Programlama Temelleri: C# veya C++ dillerinde nesne yönelimli programlama (OOP) mantığını iyice oturt.",
          "Vektör Matematiği: VR dünyasında objeleri hareket ettirmek için 3D koordinat sistemini ve Quaternions kavramını öğren.",
          "Fizik Motoru: Objelerin yerçekimine tepki vermesi ve çarpışma (collision) algılama gibi temel fizik kurallarını uygula.",
          "Sahne Yönetimi: Işıklandırma (Lighting), Skybox ve kamera sistemlerini motor içerisinde yapılandır.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: 3D Varlıklar ve Mekânsal Etkileşim Tasarımı",
        descriptions: [
          "3D Modelleme Temelleri: Blender gibi ücretsiz bir araçla basit objeler ve mesh yapısını öğren.",
          "Kaplama ve Materyal (Texturing): PBR (Physically Based Rendering) mantığını anla.",
          "Etkileşim SDK'ları: Unity için XR Interaction Toolkit kullanarak 'tutma', 'fırlatma' ve 'ışınlanma' mekaniklerini kur.",
          "El Takibi (Hand Tracking): Kontrolcü kullanmadan sadece ellerle menü yönetimi ve obje etkileşimi yapmayı dene.",
          "Spatial Audio (Mekânsal Ses): Sesin kullanıcıya yaklaştıkça artması gibi derinlik algısı sağlayan ses sistemlerini entegre et.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: AR Özel Teknolojileri ve Çevre Algılama",
        descriptions: [
          "AR Frameworks: Android için ARCore, iOS için ARKit ve cross-platform için Vuforia temellerini öğren.",
          "Düzlem Algılama (Plane Detection): Yazılımın yerdeki halıyı veya masanın üstünü bir zemin olarak tanımasını sağla.",
          "SLAM Teknolojisi: Eşzamanlı Konumlandırma ve Haritalama mantığını kavra.",
          "Marker-Based AR: Bir QR kodu veya resmi tarayınca üzerinde 3D model belirmesi projeleri yap.",
          "Işık Tahmini (Light Estimation): Dijital objenin gerçek dünyadaki ışık yönüne göre gölge bırakmasını sağla.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Optimizasyon ve Yayınlama Süreçleri",
        descriptions: [
          "Performans Analizi (Profiling): Uygulamanın hangi kısımlarının işlemciyi (CPU) veya ekran kartını (GPU) yorduğunu tespit etmeyi öğren.",
          "Draw Call Optimizasyonu: Aynı anda ekranda çok fazla objenin çizilmesini engellemek için 'Batching' tekniklerini kullan.",
          "Render Pipelines: Mobil VR için daha hafif olan URP (Universal Render Pipeline) kurulumunu yap.",
          "Kullanıcı Deneyimi (UX) Testleri: Kullanıcının görüş alanını kapatmayan, doğal hissettiren arayüzler tasarla.",
          "Yayınlama: Projeyi Meta Quest Store, App Store veya SideQuest gibi platformlara yüklemek için paketleme süreçlerini tamamla.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Dijital Adli Bilişim ve Kriptografi",
    steps: [
      RoadmapStep(
        title: "Adım 1: Temel Kavramlar ve Hukuki Süreçler",
        descriptions: [
          "Adli Bilişime Giriş: Dijital delil nedir ve nasıl tanımlanır?",
          "Hukuki Temeller: Türk Ceza Kanunu ve KVKK kapsamında dijital delil toplama yetkileri.",
          "Chain of Custody (Delil Zinciri): Delilin ele geçirilmesinden mahkemeye kadar geçen sürecin bozulmadan belgelenmesi.",
          "Etik Kurallar: İnceleme sırasında tarafsızlık ve gizlilik ilkeleri.",
          "Olay Yeri İnceleme: İlk müdahale anında yapılması gerekenler (Canlı sistem vs. kapalı sistem).",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Veri Elde Etme ve Koruma (Acquisition)",
        descriptions: [
          "Write Blocker: Delilin içeriğinin değişmesini engelleyen donanımsal ve yazılımsal araçların kullanımı.",
          "İmaj Alma: Diskin birebir kopyasını (bit-stream image) oluşturma (FTK Imager, Guymager).",
          "RAM Analizi Hazırlığı: Uçucu verilerin (RAM) sistem kapanmadan önce elde edilmesi (DumpIt, Magnet RAM Capture).",
          "Bütünlük Kontrolü (Hashing): İmajın değişmediğini kanıtlamak için MD5, SHA-1 veya SHA-256 değerlerinin hesaplanması.",
          "Depolama Ortamları: SSD, HDD ve USB belleklerdeki veri saklama farklarının anlaşılması.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Dosya Sistemleri ve Artefakt Analizi",
        descriptions: [
          "Dosya Sistemleri: NTFS, FAT32 ve EXT4 yapılarının nasıl çalıştığını öğrenmek.",
          "File Carving: Dosya tablosu bozulmuş veya silinmiş verileri manuel olarak kurtarma (Autopsy, PhotoRec).",
          "Metadata Analizi: Dosyaların oluşturulma, değiştirilme ve erişilme tarihlerinin (MAC times) incelenmesi.",
          "Windows Artefaktları: Registry (Kayıt Defteri), Prefetch, LNK dosyaları ve Shellbags analizi.",
          "Tarayıcı Adli Bilişimi: Geçmiş verileri, çerezler ve indirilen dosyaların izini sürme.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: İşletim Sistemi ve Ağ Forensiği",
        descriptions: [
          "Log Analizi: Windows Event Logs ve Linux Syslog kayıtlarının incelenmesi.",
          "Zaman Çizelgesi (Timeline) Oluşturma: Olayların kronolojik sırasını belirleyerek saldırı anını tespit etme.",
          "Network Forensics: Ağ üzerinden geçen paketlerin (PCAP) Wireshark ile analizi.",
          "Kötü Amaçlı Yazılım Tespiti: Sistemde çalışan şüpheli süreçlerin ve ağ bağlantılarının belirlenmesi.",
          "Bellek (Memory) Forensiği: Volatility aracı ile RAM imajı içinde şifre, açık bağlantı ve enjekte edilmiş kod arama.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Raporlama ve Vaka Sunumu",
        descriptions: [
          "Teknik Rapor Yazımı: Analiz adımlarının teknik terimlerle dökümante edilmesi.",
          "Yönetici Özeti: Teknik olmayan kişilerin (hakim, savcı) anlayabileceği basitlikte özet hazırlama.",
          "Bulguların Görselleştirilmesi: Timeline grafiklerini ve bağlantı şemalarını kullanma.",
          "Anti-Forensics Tespiti: Delilleri gizlemeye çalışan (şifreleme, veri silme) yöntemlerin fark edilmesi.",
          "Sunum Becerileri: Mahkeme simülasyonları ile elde edilen delillerin savunulması.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Bilgisayar Ağları ve Sistem Yönetimi",
    steps: [
      RoadmapStep(
        title: "Adım 1: Ağ Temelleri ve Teorik Altyapı",
        descriptions: [
          "OSI ve TCP/IP Modelleri: Verinin katmanlar arasındaki yolculuğunu öğrenmek.",
          "IP Adresleme: IPv4, IPv6, Subnetting (Alt ağlara bölme) mantığını kavramak.",
          "Protokoller: HTTP, HTTPS, FTP, SSH ve DNS gibi temel protokollerin ne işe yaradığını anlamak.",
          "Port Kavramı: Hangi servisin hangi kapıdan (port) geçtiğini öğrenmek.",
          "Veri Paketleri: Wireshark gibi araçlarla paketlerin içeriğini (Header, Payload) incelemek.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Ağ Cihazları ve Fiziksel Katman",
        descriptions: [
          "Donanım Tanıma: Router (Yönlendirici), Switch (Anahtar) ve Hub arasındaki farkları öğrenmek.",
          "Kablolama: Ethernet standartları ve fiber optik teknolojilerine giriş.",
          "Kablosuz Ağlar: Wi-Fi standartları ve çalışma prensipleri.",
          "Topolojiler: Yıldız, ağ (mesh) ve ağaç yapılarını kavramak.",
          "Simülasyon: Cisco Packet Tracer veya GNS3 gibi araçlarla sanal ağlar kurmak.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Yönlendirme ve Anahtarlama (Routing & Switching)",
        descriptions: [
          "VLAN Yapılandırması: Sanal ağlar oluşturarak trafiği birbirinden ayırmak.",
          "Statik ve Dinamik Routing: Verinin hangi yoldan gideceğine karar veren algoritmalar.",
          "Protokol Uygulamaları: OSPF ve BGP gibi profesyonel protokolleri yapılandırmak.",
          "NAT Konfigürasyonu: Yerel ağdaki cihazları internete çıkarmak.",
          "Switch Güvenliği: Port güvenliği (Port Security) gibi temel korumaları uygulamak.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Ağ Güvenliği ve İzleme",
        descriptions: [
          "Firewall (Güvenlik Duvarı): Gelen ve giden trafiği filtreleme kuralları yazmak.",
          "VPN Teknolojileri: Güvenli uzaktan erişim tünelleri oluşturmak.",
          "IDS/IPS: Saldırı tespit ve önleme sistemlerinin mantığını öğrenmek.",
          "Ağ İzleme: Cacti veya Zabbix gibi araçlarla bant genişliğini ve trafiği takip etmek.",
          "Erişim Kontrol Listeleri (ACL): Kimin nereye erişebileceğini kurallar ile belirlemek.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Ağ Otomasyonu ve Gelecek",
        descriptions: [
          "SDN (Yazılım Tanımlı Ağlar): Ağ yönetimini yazılım ile merkezi hale getirmek.",
          "Python ile Network Scripting: Kodla 100 cihazı aynı anda yönetmek.",
          "API Kullanımı: Ağ cihazlarını API'lar üzerinden kontrol etmek.",
          "Cloud Networking: AWS veya Azure gibi bulut platformlarında ağ yapıları kurmak.",
          "Yük Dengeleme (Load Balancing): Trafiği sunucular arasında adilce paylaştırmak.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Yazılım Mimarisi ve Proje Yönetimi",
    steps: [
      RoadmapStep(
        title: "Adım 1: Temeller ve Yazılım Mühendisliği Araçları",
        descriptions: [
          "Bir dil seç ve derinleştir: Python, Java veya C# ile OOP (nesne yönelimli programlama) temellerini öğren.",
          "Veri yapıları ve algoritmalar: Dizi, bağlı liste, ağaç, grafik, yığın; sıralama & arama algoritmaları.",
          "Karmaşıklık analizi: Big-O notasyonu ile algoritma verimliliğini analiz etmeyi öğren.",
          "Versiyon kontrolü (Git): Branch, merge, rebase, pull request iş akışlarını kavra.",
          "Test yazımı: Birim testler (unit test), entegrasyon testleri ve TDD yaklaşımı.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Mimari Tasarım Prensipleri",
        descriptions: [
          "SOLID prensipleri: Tek sorumluluk, açık/kapalı, Liskov, arayüz ayrımı, bağımlılık tersine çevirme.",
          "Tasarım kalıpları (Design Patterns): Singleton, Factory, Observer, Strategy, Decorator — GoF kataloğunu çalış.",
          "Katmanlı mimari: Sunum, iş mantığı ve veri erişim katmanlarını ayırt etmeyi öğren.",
          "API tasarımı (REST / GraphQL): Kaynak odaklı URL yapısı, HTTP metodları, durum kodları, versiyonlama.",
          "Veritabanı tasarımı: SQL normalizasyonu, indeksler, ilişkisel ve NoSQL yaklaşımlarını karşılaştır.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Sistem Mimarisi ve Ölçeklenebilirlik",
        descriptions: [
          "Monolitik vs Mikro Hizmet: Her yaklaşımın avantaj/dezavantajlarını ve geçiş stratejilerini öğren.",
          "Önbellekleme (Caching): Redis/Memcached ile uygulama, önbellek tutarlılığı ve geçersiz kılma.",
          "Mesaj kuyrukları: Kafka, RabbitMQ — asenkron iletişim, event-driven mimari.",
          "Yük dengeleme & Yatay ölçekleme: Load balancer türleri, stateless tasarım, sharding stratejileri.",
          "Gözlemlenebilirlik (Observability): Loglama, metrik toplama (Prometheus), dağıtık izleme (Jaeger).",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Bulut ve DevOps Entegrasyonu",
        descriptions: [
          "Konteyner teknolojileri: Docker ile imaj oluşturma, Docker Compose ile çok servisli ortamlar.",
          "Kubernetes temelleri: Pod, Deployment, Service, Ingress — orkestrasyon kavramları.",
          "CI/CD boru hatları: GitHub Actions / GitLab CI ile otomatik test, build ve deploy iş akışları.",
          "Bulut servisleri (AWS/GCP/Azure): EC2, S3, RDS, Lambda — sunucusuz mimariler.",
          "Altyapı kodu (IaC): Terraform veya Pulumi ile altyapıyı kod olarak yönet.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Proje Yönetimi ve Liderlik",
        descriptions: [
          "Çevik metodolojiler: Scrum, Kanban, sprint planlama ve retrospektif süreçleri.",
          "Teknik borç yönetimi: Yeniden yapılandırma (refactoring) stratejileri, kod kalite metrikleri.",
          "Mimari karar kayıtları (ADR): Kararları belgeleme, değiş tokuşları (trade-off) iletişim etme.",
          "Paydaş iletişimi: Teknik kavramları teknik olmayan kitleye aktarma, roadmap sunumları.",
          "Ekip büyütme & Mentorluk: Kod incelemeleri, çift programlama, performans geri bildirimi.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Blokzincir Teknolojileri",
    steps: [
      RoadmapStep(
        title: "Adım 1: Kriptografi ve Dağıtık Sistem Temelleri",
        descriptions: [
          "Simetrik & Asimetrik Şifreleme: AES, RSA, ECC çalışma mantığı.",
          "Hash Fonksiyonları: SHA-256, Keccak-256; çarpışma direnci kavramı.",
          "Dijital İmzalar: ECDSA — imzalama, doğrulama ve anahtar çiftleri.",
          "Merkle Ağaçları: Veri bütünlüğü doğrulama yapısı.",
          "P2P Ağ Mimarisi: Eşten eşe ağlarda düğüm keşfi ve DHT kavramları.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Blokzincir Protokolleri ve Konsensüs",
        descriptions: [
          "Bitcoin Protokolü: UTXO modeli, blok yapısı, madencilik süreci.",
          "Konsensüs Mekanizmaları: PoW, PoS, DPoS, BFT ailelerini karşılaştır.",
          "Ağ Topolojisi & Fork Kavramı: Soft fork, hard fork ve yönetim modelleri.",
          "Cüzdan Yönetimi: HD cüzdanlar, BIP-32/39/44, seed phrase güvenliği.",
          "Blokzincir Veri Yapısı: Blok başlığı, nonce, zaman damgası bileşenleri.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Akıllı Sözleşme Geliştirme (Ethereum/Solidity)",
        descriptions: [
          "Solidity Diline Giriş: Değişkenler, fonksiyonlar, modifier, event, interface.",
          "EVM Çalışma Modeli: Opcode'lar, gas mekanizması ve depolama tipleri.",
          "Geliştirme Ortamı: Hardhat veya Foundry kullanımı, test yazımı.",
          "Güvenlik Açıkları: Reentrancy, integer overflow, oracle manipülasyonu.",
          "Standartlar: ERC-20, ERC-721 (NFT), ERC-1155 standartlarını uygula.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: DeFi ve Web3 Ekosistemi",
        descriptions: [
          "DeFi Protokolleri: Uniswap AMM, Aave borçlandırma mekanizmaları.",
          "Oracle Entegrasyonu: Chainlink VRF ve Fiyat Akışları entegrasyonu.",
          "Layer 2 Çözümleri: Optimistic Rollup (Arbitrum) ve ZK-Rollup mimarileri.",
          "dApp Geliştirme: ethers.js / viem ile ön yüz bağlantısı ve imzalama.",
          "Çapraz Zincir Köprüleri: Bridge güvenlik modelleri ve likidite yönetimi.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: İleri Düzey Blokzincir Mühendisliği",
        descriptions: [
          "Sıfır Bilgi İspatları (ZKP): zk-SNARK / zk-STARK teori ve uygulaması.",
          "Kendi Zincirini Başlat: Cosmos SDK veya Substrate ile appchain geliştirme.",
          "MEV & Mempool: Flashbots, blok üreticisi dinamikleri ve MEV koruması.",
          "Yönetişim & Tokenomics: DAO tasarımı ve teşvik mekanizmaları.",
          "Denetim & Resmi Doğrulama: Slither, Mythril ve Certora Prover temelleri.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Donanım ve Mikroişlemci Tasarımı",
    steps: [
      RoadmapStep(
        title: "Adım 1: Sayısal Mantık ve Temel Elektronik",
        descriptions: [
          "Boole Cebri: İkili sistemler; AND/OR/NOT/XOR kapıları.",
          "Birleşimsel Devreler: Çoklayıcı (MUX), toplayıcı, decoder tasarımı.",
          "Ardışık Devreler: Flip-flop türleri, register, sayaç ve durum makineleri.",
          "Devre Simülasyonu: Logisim veya Digital ile kapı seviyesinde tasarım.",
          "Elektronik Bileşenler: Transistor (MOSFET), Ohm yasası ve devre analizi.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Gömülü Sistemler ve Mikrodenetleyiciler",
        descriptions: [
          "Denetleyici Temelleri: Arduino veya STM32 ile GPIO, UART kontrolü.",
          "Zamanlayıcılar & Kesmeler: Timer konfigürasyonu ve IRQ işleyicileri.",
          "Haberleşme: I2C, SPI, UART ile sensör iletişimi.",
          "Bellek Mimarisi: Flash, SRAM, EEPROM farkları ve okuma/yazma.",
          "Düşük Güç Tasarımı: Uyku modları ve batarya optimizasyonu.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Bilgisayar Organizasyonu ve Mimari (CPU Design)",
        descriptions: [
          "RISC-V ISA: Komut formatları, register dosyası, adresleme modları.",
          "CPU Boru Hattı (Pipeline): Fetch, Decode, Execute, Memory, Writeback.",
          "Hazards & Çakışma: Veri bağımlılıkları ve dallama tahminleme.",
          "Bellek Hiyerarşisi: L1/L2/L3 önbellek, TLB ve DRAM erişimi.",
          "Hata Toleransı: Parite bitleri ve Hamming kodu.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Donanım Tanımlama (HDL) ve FPGA",
        descriptions: [
          "Verilog / VHDL: Modül tanımı, always bloğu, mantık yazımı.",
          "Simülasyon: ModelSim veya Vivado ile testbench yazımı.",
          "FPGA Sentezi: Xilinx Vivado / Intel Quartus ile sentez ve zamanlama.",
          "Özel Hızlandırıcılar: Matris çarpımı veya SHA-256 donanım tasarımı.",
          "Yüksek Seviyeli Sentez (HLS): C/C++ kodundan donanım oluşturma.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Sistem Yonga (SoC) ve İleri Tasarım",
        descriptions: [
          "SoC Tasarımı: IP blok entegrasyonu ve AXI bus protokolü.",
          "VLSI & ASIC: CMOS teknolojisi ve standart hücre akışı.",
          "Güvenli Donanım: Güvenilir yürütme ortamı (TEE) ve güvenli önyükleme.",
          "AI/ML Hızlandırıcıları: TPU/NPU mimarileri ve systolic array.",
          "Açık Kaynak Donanım: OpenROAD akışı ile ASIC tasarımı denemeleri.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Mobil Uygulama Geliştirme",
    steps: [
      RoadmapStep(
        title: "Adım 1: Temel Programlama & Ortam Kurulumu",
        descriptions: [
          "Programlama temelleri öğren: Değişkenler, döngüler, koşullar, fonksiyonlar. Python veya JavaScript ile başla.",
          "Geliştirme ortamı kur: VS Code, Android Studio veya Xcode yükle. Emülatörleri çalıştır.",
          "Git & GitHub öğren: Versiyon kontrolü için temel git komutlarını pratik yap.",
          "Flutter veya React Native seç: Çapraz platform için Flutter (Dart) ya da React Native (JS) tercih et.",
          "İlk 'Hello World' uygulamasını yayınla: Emülatörde veya fiziksel cihazda çalışan ilk uygulamanı oluştur.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: UI/UX Tasarımı & Temel Bileşenler",
        descriptions: [
          "Figma ile temel tasarım: Wireframe ve mockup oluşturma. Mobil tasarım kuralları.",
          "Temel UI bileşenleri: Button, TextField, ListView, Card, Navigation gibi temel widget'lar.",
          "Düzen (Layout) yönetimi: Row, Column, Stack, Flexbox ile ekran düzeni oluştur.",
          "Navigasyon ve routing: Sayfalar arası geçiş, bottom navigation, drawer menü.",
          "Responsive tasarım: Farklı ekran boyutlarına uyum sağlayan tasarım prensipleri.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: State Management & Veri Yönetimi",
        descriptions: [
          "State nedir öğren: Stateful vs Stateless widget farkı, setState kullanımı.",
          "Provider veya Riverpod: Flutter için popüler state yönetim kütüphanelerini öğren.",
          "Yerel veri saklama: SharedPreferences, SQLite veya Hive ile cihazda veri sakla.",
          "JSON parse etme: API'den gelen JSON verileri Dart/JS nesnelerine dönüştür.",
          "Form yönetimi: Kullanıcıdan veri alma, doğrulama (validation) işlemleri.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: API Entegrasyonu & Backend Bağlantısı",
        descriptions: [
          "HTTP & REST API kavramları: GET, POST, PUT, DELETE istekleri. Status kodları.",
          "dio veya http paketi: Flutter'da API çağrısı yapma, loading state yönetimi.",
          "Firebase entegrasyonu: Authentication, Firestore veritabanı, Storage kullanımı.",
          "Hata yönetimi: Try-catch, kullanıcıya hata mesajı gösterme, retry mekanizması.",
          "Gerçek zamanlı veri: WebSocket veya Firebase Realtime Database ile canlı veri.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Test, Yayınlama & Sürekli Geliştirme",
        descriptions: [
          "Unit ve widget testleri: Flutter test paketi ile otomatik test yaz.",
          "Kullanıcı testi (beta): TestFlight (iOS) veya Internal Testing (Android) ile beta süreç.",
          "App Store & Google Play hesabı: Geliştirici hesabı aç, uygulama bilgileri ve görselleri hazırla.",
          "Release build ve imzalama: Keystore oluşturma, release APK/IPA üretme, signing.",
          "Analytics & crash reporting: Firebase Analytics ve Crashlytics ile kullanımı takip et.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Web Geliştirme (Full-Stack)",
    steps: [
      RoadmapStep(
        title: "Adım 1: HTML, CSS & Temel Web Temelleri",
        descriptions: [
          "HTML semantik yapısı: Etiketler, form elemanları, tablo, liste, bağlantı yapıları.",
          "CSS Flexbox & Grid: Modern sayfa düzeni teknikleri. Responsive tasarım temelleri.",
          "Tarayıcı geliştirici araçları: Chrome DevTools ile hata ayıklama ve CSS düzenleme.",
          "Temel JavaScript: DOM manipülasyonu, eventlar, fetch API, async/await.",
          "İlk web siteni yayınla: GitHub Pages veya Netlify ile statik site yayınlama.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Frontend Framework (React/Vue/Next.js)",
        descriptions: [
          "React temel kavramları: Component, props, state, useEffect, useState hook'ları.",
          "Component mimarisi: Yeniden kullanılabilir bileşenler tasarlama, prop drilling.",
          "React Router: Çok sayfalı SPA uygulaması, yönlendirme, dinamik rotalar.",
          "Tailwind CSS: Utility-first CSS framework ile hızlı ve tutarlı tasarım.",
          "Next.js ile SSR & SSG: Server-side rendering, statik site üretimi, SEO optimizasyonu.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Backend Geliştirme (Node.js / API)",
        descriptions: [
          "Node.js & Express temelleri: HTTP server kurma, route tanımlama, middleware kullanımı.",
          "REST API tasarımı: Endpoint tasarımı, HTTP metotları, JSON yanıtları standartları.",
          "Veritabanı seçimi: PostgreSQL (ilişkisel) veya MongoDB (NoSQL) farkları ve kullanımı.",
          "ORM kullanımı: Prisma veya Mongoose ile veritabanı işlemlerini kolaylaştır.",
          "JWT ile kimlik doğrulama: Kullanıcı kayıt/giriş, token üretme, route koruma (guard).",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Full-Stack Entegrasyon & Güvenlik",
        descriptions: [
          "CORS ve API güvenliği: Cross-Origin istekler, güvenli header yapılandırması.",
          "Ortam değişkenleri (.env): Gizli bilgileri kaynak koddan ayırma.",
          "Input validation: Kullanıcıdan gelen verileri doğrulama, SQL Injection ve XSS önleme.",
          "File upload & storage: Resim/dosya yükleme, Cloudinary veya AWS S3 entegrasyonu.",
          "API dokümantasyonu: Swagger/OpenAPI ile API belgesi oluşturma.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: DevOps, Deployment & Performans",
        descriptions: [
          "Docker ile containerization: Dockerfile yaz, image oluştur, container çalıştır.",
          "CI/CD pipeline: GitHub Actions ile otomatik test ve deployment akışı kur.",
          "Cloud deployment: Vercel (frontend), Railway veya Render (backend) ile yayınla.",
          "Performans optimizasyonu: Lighthouse skoru, lazy loading, code splitting, caching.",
          "Monitoring & loglama: Sentry ile hata takibi, uptime monitoring, log yönetimi.",
        ],
      ),
    ],
  ),
  RoadmapCategory(
    title: "Oyun Geliştirme",
    steps: [
      RoadmapStep(
        title: "Adım 1: Programlama Temelleri & Engine Seçimi",
        descriptions: [
          "C# veya GDScript öğren: Unity için C#, Godot için GDScript. Temel sözdizimi ve OOP kavramları.",
          "Unity veya Godot kur: Engine'i indir, proje aç, editör arayüzünü tanı.",
          "Sahne ve nesne sistemi: Scene, GameObject/Node kavramları, hiyerarşi yapısı.",
          "Inspector ve component sistemi: Bileşen tabanlı geliştirme, Transform, Rigidbody kullanımı.",
          "İlk oynanabilir nesneyi hareket ettir: Klavye ile kontrol edilen basit bir karakter oluştur.",
        ],
      ),
      RoadmapStep(
        title: "Adım 2: Fizik, Animasyon & Görsel Tasarım",
        descriptions: [
          "Fizik motoru temelleri: Collider, Rigidbody, gravity, force uygulama, trigger kullanımı.",
          "Sprite & animasyon: 2D sprite oluşturma, Animator Controller, animation clip.",
          "Particle efektleri: Patlama, duman, ışık efektleri için particle system kullanımı.",
          "Kamera sistemi: Follow camera, cinemachine, kamera sınırları ve geçişleri.",
          "Ses entegrasyonu: AudioSource ile ses efekti ve müzik ekleme, ses yönetimi.",
        ],
      ),
      RoadmapStep(
        title: "Adım 3: Oyun Mekaniği & Tasarım Prensipleri",
        descriptions: [
          "Game design dökümanı (GDD): Oyun fikrinin kağıda dökülmesi, kural ve hedef tanımı.",
          "Oyun döngüsü (game loop): Core loop tasarımı: hedef, eylem, ödül, tekrar.",
          "Düşman yapay zekası (AI): Basit state machine, patrol, chase, attack davranışları.",
          "Level tasarımı: Tilemap kullanımı, bölüm akışı, zorluk dengesi kurma.",
          "UI/HUD tasarımı: Can barı, skor, mini harita gibi oyun içi arayüz öğeleri.",
        ],
      ),
      RoadmapStep(
        title: "Adım 4: Veri Yönetimi, Kayıt & Skor Sistemi",
        descriptions: [
          "PlayerPrefs ile basit kayıt: Skor, ses ayarı gibi küçük verileri cihazda sakla.",
          "JSON ile oyun kaydetme: Karmaşık oyun durumunu JSON dosyasına serialize et.",
          "ScriptableObject kullanımı: Silah, karakter, level verilerini ScriptableObject ile yönet.",
          "Online skor tablosu: Unity Gaming Services veya PlayFab ile leaderboard oluştur.",
          "Başarım (achievement) sistemi: Oyun içi başarıları takip eden sistem tasarla ve entegre et.",
        ],
      ),
      RoadmapStep(
        title: "Adım 5: Optimizasyon, Test & Yayınlama",
        descriptions: [
          "Profiler ile performans analizi: Unity Profiler ile CPU/GPU darboğazlarını tespit et ve çöz.",
          "Batching ve draw call azaltma: Sprite atlas, static batching, LOD kullanarak performans artır.",
          "Playtesting süreci: Farklı kullanıcılarla test et, geri bildirim topla ve döngüyü tekrarla.",
          "Build ve platform seçimi: PC (Steam), mobil (Android/iOS) veya itch.io için build al.",
          "Yayın ve pazarlama: Trailer hazırla, sosyal medyada paylaş, devlog yaz, topluluk oluştur.",
        ],
      ),
    ],
  ),
];
