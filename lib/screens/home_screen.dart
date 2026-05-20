import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

import '../screens/test_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../screens/career_test_screen.dart';

import '../screens/roadmap_screen.dart';

import '../widgets/app_shell.dart';

import '../screens/projects_screen.dart';

import '../screens/profile_screen.dart';

import '../data/roadmap_data.dart';
import '../data/projects_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 390;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.only(top: 4, left: 4, right: 4),
            child: _HeroCard(),
          ),
          const SizedBox(height: 18),
          SectionHeader(
            title: 'Günlük Görev',
            action: 'Tümünü Gör',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          const _DailyTaskCard(),
          const SizedBox(height: 18),
          SectionHeader(title: 'Testler', action: 'Tümünü Gör', onTap: () {}),
          const SizedBox(height: 12),
          const _TeamCohesionTestCard(),
          const SizedBox(height: 12),
          const _TechnicalEnglishTestCard(),
          const SizedBox(height: 18),
          const Text(
            'Alternatif Alanlar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: compact ? 142 : 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                _AltFieldCard(
                  name: 'Web Geliştirme',
                  categoryTitle: 'Web Geliştirme (Full-Stack)',
                  icon: Icons.language_rounded,
                  accent: Color(0xFF60A5FA),
                ),
                _AltFieldCard(
                  name: 'Oyun Geliştirme',
                  categoryTitle: 'Oyun Geliştirme',
                  icon: Icons.sports_esports_rounded,
                  accent: Color(0xFFA855F7),
                ),
                _AltFieldCard(
                  name: 'Veri Bilimi',
                  categoryTitle: 'Veri Bilimi & Büyük Veri',
                  icon: Icons.query_stats_rounded,
                  accent: Color(0xFF34D399),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCard extends StatefulWidget {
  const _HeroCard();

  @override
  State<_HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<_HeroCard> {
  String recommendedField = "Kariyer Testini Çöz!";
  bool hasTested = false; // Testin çözülüp çözülmediğini takip ediyoruz

  @override
  void initState() {
    super.initState();
    _loadResult();
  }

  Future<void> _loadResult() async {
    final prefs = await SharedPreferences.getInstance();
    final savedField = prefs.getString('recommended_field');

    setState(() {
      if (savedField != null) {
        recommendedField = savedField;
        hasTested = true;
      } else {
        recommendedField = "Kariyer Testini Çöz!";
        hasTested = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void openCareerTest() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CareerTestScreen()),
      ).then((_) {
        _loadResult();
      });
    }

    void openRoadmap() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AppShell(
            initialIndex: 1,
            tabs: const [
              HomeScreen(),
              RoadmapScreen(),
              ProjectsScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      );
    }

    return GlassCard(
      gradient: const LinearGradient(
        colors: [Color(0x6611183A), Color(0x22000000)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            top: -24,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1AA855F7),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hasTested ? 'ÖNERİLEN ALANIN' : 'YOL HARİTANI BELİRLE',
                style: const TextStyle(
                  color: Color(0xFFA855F7),
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                recommendedField,
                style: const TextStyle(
                  fontSize: 24,
                  height: 1.1,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                hasTested
                    ? 'Profiline en uygun alan bu!'
                    : 'Sana en uygun alanı bulmak için tıkla ve 10 soruluk testi tamamla.',
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),

              if (hasTested)
                Row(
                  children: [
                    _TextActionButton(
                      label: 'Yol Haritasını Bul',
                      icon: Icons.map_rounded,
                      accent: const Color(0xFFA855F7),
                      onTap: openRoadmap,
                    ),
                    const SizedBox(width: 18),
                    _TextActionButton(
                      label: 'Tekrar Çöz',
                      icon: Icons.refresh_rounded,
                      accent: const Color(0xFF9CA3AF),
                      onTap: openCareerTest,
                    ),
                  ],
                )
              else
                _TextActionButton(
                  label: 'Teste Başla',
                  icon: Icons.arrow_forward_rounded,
                  accent: const Color(0xFFA855F7),
                  onTap: openCareerTest,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DailyTaskCard extends StatefulWidget {
  const _DailyTaskCard();

  @override
  State<_DailyTaskCard> createState() => _DailyTaskCardState();
}

class _DailyTaskCardState extends State<_DailyTaskCard> {
  String _taskTitle = 'Henüz günlük görev yok';
  String _taskSubtitle = 'Kariyer testini çözerek kişisel görevini oluştur.';
  ProjectModel? _activeProject;

  @override
  void initState() {
    super.initState();
    _loadDailyTask();
  }

  String _mapTestResultToCategoryTitle(String result) {
    switch (result) {
      case "Web Geliştirme (Full-Stack)":
        return "Web Geliştirme (Full-Stack)";
      case "Mobil Uygulama Geliştirme":
        return "Mobil Uygulama Geliştirme";
      case "Yapay Zeka ve Makine Öğrenmesi":
        return "Yapay Zeka ve Makine Öğrenmesi";
      case "Veri Bilimi ve Büyük Veri":
        return "Veri Bilimi & Büyük Veri";
      case "Gömülü Sistemler ve IoT":
        return "Gömülü Sistemler ve IoT";
      case "Robotik ve Otomasyon":
        return "Robotik ve Otomasyon";
      case "Bulut Bilişim ve DevOps":
        return "Bulut Bilişim";
      case "Bilgisayar Ağları ve Sistem Yönetimi":
        return "Bilgisayar Ağları ve Sistem Yönetimi";
      case "Dijital Adli Bilişim ve Kriptografi":
        return "Dijital Adli Bilişim ve Kriptografi";
      case "Siber Güvenlik":
        return "Siber Güvenlik";
      case "Yazılım Mimarisi ve Proje Yönetimi":
        return "Yazılım Mimarisi ve Proje Yönetimi";
      case "Sanal ve Arttırılmış Gerçeklik (VR/AR)":
      case "Sanal ve Artırılmış Gerçeklik (VR/AR)":
        return "Sanal ve Artırılmış Gerçeklik (VR/AR)";
      case "Oyun Geliştirme ve Grafik Programlama":
        return "Oyun Geliştirme";
      case "Blokzincir Teknolojileri":
        return "Blokzincir Teknolojileri";
      case "Donanım ve Mikroişlemci Tasarımı":
        return "Donanım ve Mikroişlemci Tasarımı";
      default:
        return "";
    }
  }

  String _itemKey(String categoryTitle, int stepIndex, int descIndex) {
    return '${categoryTitle}_${stepIndex}_$descIndex';
  }

  Future<void> _loadDailyTask() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Check if there is an active project
    final activeTitle = prefs.getString('active_project_title');
    if (activeTitle != null) {
      final proj = projectsList
          .where((p) => p.title == activeTitle)
          .cast<ProjectModel?>()
          .firstWhere((p) => p != null, orElse: () => null);
          
      if (proj != null) {
        _activeProject = proj;
        final category = roadmapCategories.firstWhere(
          (cat) => cat.title == proj.categoryTitle,
          orElse: () => roadmapCategories[0],
        );
        
        int incompleteStepIndex = -1;
        for (int i = 0; i < category.steps.length; i++) {
          final isCompleted = prefs.getBool('project_progress_${proj.title}_$i') == true;
          if (!isCompleted) {
            incompleteStepIndex = i;
            break;
          }
        }
        
        if (incompleteStepIndex != -1) {
          setState(() {
            _taskTitle = category.steps[incompleteStepIndex].title;
            _taskSubtitle = 'Aktif Proje: ${proj.title} (${proj.categoryTitle})';
          });
        } else {
          setState(() {
            _taskTitle = 'Tebrikler! Projeyi tamamladın';
            _taskSubtitle = 'Aktif Proje: ${proj.title} • Gelişmeye devam et!';
          });
        }
        return;
      }
    }

    _activeProject = null;
    final recommendedField = prefs.getString('recommended_field');

    if (recommendedField == null) {
      setState(() {
        _taskTitle = 'Kariyer testini çöz';
        _taskSubtitle = 'Sana özel görevleri görmek için önce alanını belirle.';
      });
      return;
    }

    final targetTitle = _mapTestResultToCategoryTitle(recommendedField);

    final category = roadmapCategories
        .where((cat) => cat.title == targetTitle)
        .cast<RoadmapCategory?>()
        .firstWhere((cat) => cat != null, orElse: () => null);

    if (category == null) {
      setState(() {
        _taskTitle = 'Günlük görev bulunamadı';
        _taskSubtitle = 'Önerilen alan yol haritasıyla eşleşmedi.';
      });
      return;
    }

    for (int stepIndex = 0; stepIndex < category.steps.length; stepIndex++) {
      final step = category.steps[stepIndex];

      for (
        int descIndex = 0;
        descIndex < step.descriptions.length;
        descIndex++
      ) {
        final key = _itemKey(category.title, stepIndex, descIndex);
        final isChecked = prefs.getBool(key) == true;

        if (!isChecked) {
          setState(() {
            _taskTitle = step.descriptions[descIndex];
            _taskSubtitle = '${category.title} • ${step.title}';
          });
          return;
        }
      }
    }

    setState(() {
      _taskTitle = 'Tebrikler! Alan görevlerini tamamladın';
      _taskSubtitle =
          '${category.title} yol haritasındaki tüm maddeler tamamlandı.';
    });
  }

  void _onTap() async {
    if (_activeProject != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => ProjectDetailBottomSheet(
          project: _activeProject!,
          onProjectStarted: () {
            _loadDailyTask();
          },
        ),
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      if (!mounted) return;
      final recommendedField = prefs.getString('recommended_field');
      if (recommendedField == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CareerTestScreen()),
        ).then((_) => _loadDailyTask());
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AppShell(
              initialIndex: 1,
              tabs: const [
                HomeScreen(),
                RoadmapScreen(),
                ProjectsScreen(),
                ProfileScreen(),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: GlassCard(
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0x1AA855F7),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0x33A855F7)),
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                color: Color(0xFFB16CF9),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _taskTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _taskSubtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AltFieldCard extends StatefulWidget {
  const _AltFieldCard({
    required this.name,
    required this.categoryTitle,
    required this.icon,
    required this.accent,
  });

  final String name;
  final String categoryTitle;
  final IconData icon;
  final Color accent;

  @override
  State<_AltFieldCard> createState() => _AltFieldCardState();
}

class _AltFieldCardState extends State<_AltFieldCard> {
  int _completionPercentage = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    
    final category = roadmapCategories
        .where((cat) => cat.title == widget.categoryTitle)
        .cast<RoadmapCategory?>()
        .firstWhere((cat) => cat != null, orElse: () => null);

    if (category == null) return;

    int totalItems = 0;
    int checkedItems = 0;

    for (int stepIndex = 0; stepIndex < category.steps.length; stepIndex++) {
      final step = category.steps[stepIndex];
      for (int descIndex = 0; descIndex < step.descriptions.length; descIndex++) {
        totalItems++;
        final key = '${category.title}_${stepIndex}_$descIndex';
        if (prefs.getBool(key) == true) {
          checkedItems++;
        }
      }
    }

    if (mounted) {
      setState(() {
        _completionPercentage = totalItems > 0 ? ((checkedItems / totalItems) * 100).round() : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AppShell(
                initialIndex: 1,
                tabs: [
                  const HomeScreen(),
                  RoadmapScreen(initialCategoryTitle: widget.categoryTitle),
                  const ProjectsScreen(),
                  const ProfileScreen(),
                ],
              ),
            ),
          );
        },
        child: SizedBox(
          width: 155,
          child: GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: widget.accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: widget.accent.withValues(alpha: 0.25)),
                      ),
                      child: Icon(widget.icon, size: 18, color: widget.accent),
                    ),
                    Text(
                      '%$_completionPercentage',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tamamlanma',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFF6B7280),
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextActionButton extends StatelessWidget {
  const _TextActionButton({
    required this.label,
    required this.icon,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: accent,
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 6),
            Icon(icon, color: accent, size: 16),
          ],
        ),
      ),
    );
  }
}

// Gerekli importu en üste eklemeyi unutma:
// import 'screens/team_cohesion_test_screen.dart';

class _TeamCohesionTestCard extends StatelessWidget {
  const _TeamCohesionTestCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CareerTestScreen()),
        ).then((value) {
          // Kullanıcı testten dönünce ana sayfayı yenile (Stateful widget içindeysen geçerlidir)
          // Eğer HomeScreen stateless ise, uygulamayı kapatıp açtığında sonuç zaten güncellenmiş olur.
        });
      },
      child: GlassCard(
        child: Row(
          children: [
            // İkon Alanı
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0x1A34D399), // Yeşilimsi bir ton
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0x3334D399)),
              ),
              child: const Icon(Icons.groups_rounded, color: Color(0xFF34D399)),
            ),
            const SizedBox(width: 14),
            // Metin Alanı
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Takım Uyumluluk Testi',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Bulanık mantık ile ekip içindeki rolünü ve uyumunu analiz et.',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Ok ikonu
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}

class _TechnicalEnglishTestCard extends StatelessWidget {
  const _TechnicalEnglishTestCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TestScreen(
              title: 'Teknik İngilizce Testi',
              assetPath:
                  'lib/data/teknik_ingilizce_alan_bazli_test_sorulari_v2.json',
              questionLimit: 20,
            ),
          ),
        );
      },
      child: GlassCard(
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0x1A60A5FA),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0x3360A5FA)),
              ),
              child: const Icon(
                Icons.translate_rounded,
                color: Color(0xFF60A5FA),
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Teknik İngilizce Testi',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'JSON verisinden yüklenen alan bazlı sorularla seviyeni ölç.',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Color(0xFF60A5FA),
            ),
          ],
        ),
      ),
    );
  }
}
