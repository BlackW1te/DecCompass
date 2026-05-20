import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/shared_widgets.dart';
import '../data/projects_data.dart';
import '../data/roadmap_data.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _selectedCategory = 'Tümü';
  String? _activeProjectTitle;
  String? _recommendedField;

  final List<String> _categories = [
    'Tümü',
    'Mobil Uygulama Geliştirme',
    'Web Geliştirme (Full-Stack)',
    'Oyun Geliştirme',
    'Yapay Zeka ve Makine Öğrenmesi',
    'Veri Bilimi & Büyük Veri',
    'DevOps Mühendisliği',
    'Bulut Bilişim',
    'Robotik ve Otomasyon',
    'Gömülü Sistemler ve IoT',
    'Sanal ve Artırılmış Gerçeklik (VR/AR)',
    'Dijital Adli Bilişim ve Kriptografi',
    'Bilgisayar Ağları ve Sistem Yönetimi',
    'Yazılım Mimarisi ve Proje Yönetimi',
    'Blokzincir Teknolojileri',
    'Donanım ve Mikroişlemci Tasarımı',
    'Siber Güvenlik',
  ];

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _activeProjectTitle = prefs.getString('active_project_title');
      _recommendedField = prefs.getString('recommended_field');
    });
  }

  ProjectModel _getRecommendation() {
    if (_activeProjectTitle != null) {
      final activeProj = projectsList
          .where((p) => p.title == _activeProjectTitle)
          .cast<ProjectModel?>()
          .firstWhere((p) => p != null, orElse: () => null);
      if (activeProj != null) return activeProj;
    }

    String searchCategory = "Mobil Uygulama Geliştirme";
    if (_recommendedField != null) {
      switch (_recommendedField) {
        case "Web Geliştirme (Full-Stack)":
          searchCategory = "Web Geliştirme (Full-Stack)";
          break;
        case "Mobil Uygulama Geliştirme":
          searchCategory = "Mobil Uygulama Geliştirme";
          break;
        case "Yapay Zeka ve Makine Öğrenmesi":
          searchCategory = "Yapay Zeka ve Makine Öğrenmesi";
          break;
        case "Veri Bilimi ve Büyük Veri":
          searchCategory = "Veri Bilimi & Büyük Veri";
          break;
        case "Gömülü Sistemler ve IoT":
          searchCategory = "Gömülü Sistemler ve IoT";
          break;
        case "Robotik ve Otomasyon":
          searchCategory = "Robotik ve Otomasyon";
          break;
        case "Bulut Bilişim ve DevOps":
        case "Bulut Bilişim":
          searchCategory = "Bulut Bilişim";
          break;
        case "DevOps Mühendisliği":
          searchCategory = "DevOps Mühendisliği";
          break;
        case "Bilgisayar Ağları ve Sistem Yönetimi":
          searchCategory = "Bilgisayar Ağları ve Sistem Yönetimi";
          break;
        case "Dijital Adli Bilişim ve Kriptografi":
          searchCategory = "Dijital Adli Bilişim ve Kriptografi";
          break;
        case "Siber Güvenlik":
          searchCategory = "Siber Güvenlik";
          break;
        case "Yazılım Mimarisi ve Proje Yönetimi":
          searchCategory = "Yazılım Mimarisi ve Proje Yönetimi";
          break;
        case "Sanal ve Arttırılmış Gerçeklik (VR/AR)":
        case "Sanal ve Artırılmış Gerçeklik (VR/AR)":
          searchCategory = "Sanal ve Artırılmış Gerçeklik (VR/AR)";
          break;
        case "Oyun Geliştirme ve Grafik Programlama":
        case "Oyun Geliştirme":
          searchCategory = "Oyun Geliştirme";
          break;
        case "Blokzincir Teknolojileri":
          searchCategory = "Blokzincir Teknolojileri";
          break;
        case "Donanım ve Mikroişlemci Tasarımı":
          searchCategory = "Donanım ve Mikroişlemci Tasarımı";
          break;
      }
    }

    return projectsList.firstWhere(
      (proj) => proj.categoryTitle == searchCategory,
      orElse: () => projectsList.firstWhere(
        (p) => p.categoryTitle == 'Mobil Uygulama Geliştirme',
        orElse: () => projectsList[0],
      ),
    );
  }

  void _showProjectDetail(ProjectModel project) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProjectDetailBottomSheet(
        project: project,
        onProjectStarted: () {
          _loadState();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recommendation = _getRecommendation();
    final isRecommendationActive = recommendation.title == _activeProjectTitle;

    final filteredProjects = _selectedCategory == 'Tümü'
        ? projectsList
        : projectsList.where((p) => p.categoryTitle == _selectedCategory).toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Projeler',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: const Color(0x14A855F7),
                  border: Border.all(color: const Color(0x33A855F7)),
                ),
                child: Text(
                  'TOPLAM: ${projectsList.length}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFCB9BFF),
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Hedefe uygun projeler ve pratik görevler.',
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          
          // Recommendation Banner
          GlassCard(
            gradient: const LinearGradient(
              colors: [Color(0x331E3A8A), Color(0x22000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isRecommendationActive ? 'AKTİF PROJEN' : 'SANA ÖZEL ÖNERİ',
                        style: const TextStyle(
                          color: Color(0xFF818CF8),
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        recommendation.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recommendation.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Pill(label: recommendation.level, color: const Color(0xFF8B5CF6)),
                          const SizedBox(width: 8),
                          Pill(
                            label: recommendation.tags.isNotEmpty ? recommendation.tags[0] : 'Kod',
                            color: const Color(0xFF38BDF8),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () => _showProjectDetail(recommendation),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          isRecommendationActive ? 'Projede İlerle' : 'Projeyi Gör',
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 80,
                  height: 140,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getCategoryColor(recommendation.categoryTitle).withValues(alpha: 0.1),
                        ),
                      ),
                      Icon(
                        _getCategoryIcon(recommendation.categoryTitle),
                        size: 40,
                        color: _getCategoryColor(recommendation.categoryTitle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Category Selector Filter Chips
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final displayName = category == 'Tümü'
                    ? 'Tümü'
                    : category.replaceAll(' Geliştirme', '').replaceAll(' Mühendisliği', '');
                final active = category == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: active ? const Color(0xFFA855F7) : const Color(0x0AFFFFFF),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: active ? const Color(0x22A855F7) : const Color(0x12FFFFFF),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayName,
                          style: TextStyle(
                            color: active ? Colors.white : const Color(0xFF9CA3AF),
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Projects List
          ...filteredProjects.map((project) {
            final isActive = project.title == _activeProjectTitle;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ProjectItem(
                project: project,
                isActive: isActive,
                onTap: () => _showProjectDetail(project),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  const _ProjectItem({
    required this.project,
    required this.isActive,
    required this.onTap,
  });

  final ProjectModel project;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = _getCategoryColor(project.categoryTitle);
    final icon = _getCategoryIcon(project.categoryTitle);

    return GlassCard(
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: accent.withValues(alpha: 0.18)),
            ),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    Pill(label: project.level, color: const Color(0xFF4B5563)),
                    ...project.tags.map((tag) => Pill(label: tag, color: const Color(0x22FFFFFF))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isActive ? 'AKTİF' : 'BEKLEYEN',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: isActive ? const Color(0xFF34D399) : const Color(0xFFA855F7),
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: isActive ? const Color(0xFF34D399) : const Color(0xFFA855F7),
                  side: BorderSide(
                    color: isActive ? const Color(0x3334D399) : const Color(0x33A855F7),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  isActive ? 'İLERLE' : 'BAŞLA',
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Color _getCategoryColor(String category) {
  switch (category) {
    case "Siber Güvenlik":
      return const Color(0xFFEF4444);
    case "Yapay Zeka ve Makine Öğrenmesi":
      return const Color(0xFFA855F7);
    case "Veri Bilimi & Büyük Veri":
      return const Color(0xFF10B981);
    case "DevOps Mühendisliği":
      return const Color(0xFFF59E0B);
    case "Bulut Bilişim":
      return const Color(0xFF06B6D4);
    case "Robotik ve Otomasyon":
      return const Color(0xFFEC4899);
    case "Gömülü Sistemler ve IoT":
      return const Color(0xFF14B8A6);
    case "Sanal ve Artırılmış Gerçeklik (VR/AR)":
    case "Sanal ve Arttırılmış Gerçeklik (VR/AR)":
      return const Color(0xFF6366F1);
    case "Dijital Adli Bilişim ve Kriptografi":
      return const Color(0xFFF43F5E);
    case "Bilgisayar Ağları ve Sistem Yönetimi":
      return const Color(0xFF3B82F6);
    case "Yazılım Mimarisi ve Proje Yönetimi":
      return const Color(0xFF84CC16);
    case "Blokzincir Teknolojileri":
      return const Color(0xFFD946EF);
    case "Donanım ve Mikroişlemci Tasarımı":
      return const Color(0xFF6B7280);
    case "Mobil Uygulama Geliştirme":
      return const Color(0xFFF97316);
    case "Web Geliştirme (Full-Stack)":
      return const Color(0xFF2563EB);
    case "Oyun Geliştirme":
      return const Color(0xFFEAB308);
    default:
      return const Color(0xFF9CA3AF);
  }
}

IconData _getCategoryIcon(String category) {
  switch (category) {
    case "Siber Güvenlik":
      return Icons.shield_rounded;
    case "Yapay Zeka ve Makine Öğrenmesi":
      return Icons.psychology_rounded;
    case "Veri Bilimi & Büyük Veri":
      return Icons.analytics_rounded;
    case "DevOps Mühendisliği":
      return Icons.terminal_rounded;
    case "Bulut Bilişim":
      return Icons.cloud_rounded;
    case "Robotik ve Otomasyon":
      return Icons.smart_toy_rounded;
    case "Gömülü Sistemler ve IoT":
      return Icons.developer_board_rounded;
    case "Sanal ve Artırılmış Gerçeklik (VR/AR)":
    case "Sanal ve Arttırılmış Gerçeklik (VR/AR)":
      return Icons.view_in_ar_rounded;
    case "Dijital Adli Bilişim ve Kriptografi":
      return Icons.fingerprint_rounded;
    case "Bilgisayar Ağları ve Sistem Yönetimi":
      return Icons.router_rounded;
    case "Yazılım Mimarisi ve Proje Yönetimi":
      return Icons.account_tree_rounded;
    case "Blokzincir Teknolojileri":
      return Icons.currency_bitcoin_rounded;
    case "Donanım ve Mikroişlemci Tasarımı":
      return Icons.memory_rounded;
    case "Mobil Uygulama Geliştirme":
      return Icons.phone_android_rounded;
    case "Web Geliştirme (Full-Stack)":
      return Icons.language_rounded;
    case "Oyun Geliştirme":
      return Icons.sports_esports_rounded;
    default:
      return Icons.code_rounded;
  }
}

class ProjectDetailBottomSheet extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onProjectStarted;

  const ProjectDetailBottomSheet({
    super.key,
    required this.project,
    required this.onProjectStarted,
  });

  @override
  State<ProjectDetailBottomSheet> createState() => _ProjectDetailBottomSheetState();
}

class _ProjectDetailBottomSheetState extends State<ProjectDetailBottomSheet> {
  bool _isActive = false;
  List<bool> _stepsCompleted = List.filled(5, false);
  RoadmapCategory? _category;

  @override
  void initState() {
    super.initState();
    _loadProjectState();
  }

  Future<void> _loadProjectState() async {
    final prefs = await SharedPreferences.getInstance();
    final activeTitle = prefs.getString('active_project_title');
    
    // Find category to get steps
    final category = roadmapCategories.firstWhere(
      (cat) => cat.title == widget.project.categoryTitle,
      orElse: () => roadmapCategories[0],
    );
    
    final isActive = activeTitle == widget.project.title;
    
    List<bool> stepsCompleted = List.filled(5, false);
    for (int i = 0; i < 5; i++) {
      stepsCompleted[i] = prefs.getBool('project_progress_${widget.project.title}_$i') ?? false;
    }

    setState(() {
      _isActive = isActive;
      _stepsCompleted = stepsCompleted;
      _category = category;
    });
  }

  Future<void> _startProject() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('active_project_title', widget.project.title);
    await prefs.setString('active_project_category', widget.project.categoryTitle);
    
    // Set other projects' steps to false or initialize this one's
    for (int i = 0; i < 5; i++) {
      await prefs.setBool('project_progress_${widget.project.title}_$i', false);
    }

    setState(() {
      _isActive = true;
      _stepsCompleted = List.filled(5, false);
    });

    widget.onProjectStarted();
  }

  Future<void> _toggleStep(int index, bool val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('project_progress_${widget.project.title}_$index', val);
    setState(() {
      _stepsCompleted[index] = val;
    });
    widget.onProjectStarted();
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _getCategoryColor(widget.project.categoryTitle);
    
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 46,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${widget.project.categoryTitle.toUpperCase()} • ${widget.project.level.toUpperCase()}',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              if (_isActive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0x1A34D399),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0x3334D399)),
                  ),
                  child: const Text(
                    'AKTİF PROJE',
                    style: TextStyle(
                      color: Color(0xFF34D399),
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.project.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.project.description,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          const Divider(color: Color(0x1AFFFFFF)),
          const SizedBox(height: 8),
          const Text(
            'PROJE ADIMLARI',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 12),
          if (_category != null)
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _category!.steps.length,
                itemBuilder: (context, index) {
                  final step = _category!.steps[index];
                  final isDone = _stepsCompleted[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isDone,
                          activeColor: accentColor,
                          onChanged: _isActive
                              ? (val) => _toggleStep(index, val ?? false)
                              : null,
                          side: const BorderSide(color: Color(0xFF374151), width: 1.5),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Opacity(
                            opacity: _isActive ? 1.0 : 0.5,
                            child: Text(
                              step.title,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                decoration: isDone ? TextDecoration.lineThrough : null,
                                color: isDone ? const Color(0xFF6B7280) : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          const SizedBox(height: 20),
          if (!_isActive)
            FilledButton(
              onPressed: _startProject,
              style: FilledButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'PROJEYE BAŞLA',
                style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.0),
              ),
            )
          else
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'KAPAT',
                style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.0),
              ),
            ),
        ],
      ),
    );
  }
}
