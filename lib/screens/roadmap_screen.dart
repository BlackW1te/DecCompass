import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/roadmap_data.dart';
import '../widgets/shared_widgets.dart';

import '../screens/career_test_screen.dart';

class RoadmapScreen extends StatefulWidget {
  final String? initialCategoryTitle;

  const RoadmapScreen({super.key, this.initialCategoryTitle});

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  String _recommendedField = "Henüz Test Çözülmedi";
  late final List<GlobalKey<_ExpandableRoadmapCategoryState>> _categoryKeys;

  @override
  void initState() {
    super.initState();
    _categoryKeys = List.generate(
      roadmapCategories.length,
      (index) => GlobalKey<_ExpandableRoadmapCategoryState>(),
    );
    _loadRecommendedField();

    if (widget.initialCategoryTitle != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _expandAndScrollTo(widget.initialCategoryTitle!);
      });
    }
  }

  void _expandAndScrollTo(String title) {
    int targetIndex = roadmapCategories.indexWhere((cat) => cat.title == title);
    if (targetIndex != -1) {
      final key = _categoryKeys[targetIndex];
      key.currentState?.expand();
      if (key.currentContext != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
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

  void _onStartPressed() {
    if (_recommendedField == "Henüz Test Çözülmedi") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CareerTestScreen()),
      ).then((_) {
        _loadRecommendedField();
      });

      return;
    }

    String targetTitle = _mapTestResultToCategoryTitle(_recommendedField);
    _expandAndScrollTo(targetTitle);
  }

  Future<void> _loadRecommendedField() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recommendedField =
          prefs.getString('recommended_field') ?? "Henüz Test Çözülmedi";
    });
  }

  void _showFieldPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              const Text(
                'ALAN SEÇ',
                style: TextStyle(
                  color: Color(0xFFA855F7),
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Devam etmek istediğin alanı seç',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: roadmapCategories.length,
                  itemBuilder: (context, index) {
                    final category = roadmapCategories[index];
                    final isSelected = category.title == _recommendedField;
                    const colors = [
                      Color(0xFF60A5FA),
                      Color(0xFFA855F7),
                      Color(0xFFF59E0B),
                      Color(0xFF34D399),
                    ];
                    final accent = colors[index % colors.length];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('recommended_field', category.title);
                          setState(() {
                            _recommendedField = category.title;
                          });
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                          // Scroll to selected category after modal closes
                          Future.delayed(const Duration(milliseconds: 350), () {
                            _expandAndScrollTo(category.title);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? accent.withValues(alpha: 0.12)
                                : Colors.white.withValues(alpha: 0.03),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? accent.withValues(alpha: 0.4)
                                  : Colors.white.withValues(alpha: 0.06),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: accent.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  _getCategoryIcon(category.title),
                                  color: accent,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  category.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: isSelected ? accent : Colors.white,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: accent,
                                  size: 22,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          const Text(
            'Yol Haritası',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Kişisel planını adım adım ilerlet.',
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          GlassCard(
            gradient: const LinearGradient(
              colors: [Color(0x331D4ED8), Color(0x22000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SEÇİLİ ALAN',
                        style: TextStyle(
                          color: Color(0xFF818CF8),
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _recommendedField,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          height: 1.05,
                          letterSpacing: -0.7,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Hedefe göre hazırlanmış ilerleme planı.',
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: FilledButton(
                              onPressed: _onStartPressed,
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFA855F7),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Başla',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: OutlinedButton.icon(
                              onPressed: _showFieldPicker,
                              icon: const Icon(Icons.swap_horiz_rounded, size: 16),
                              label: const Text(
                                'Değiştir',
                                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF818CF8),
                                side: const BorderSide(color: Color(0x33818CF8)),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 92,
                  height: 92,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0.18),
                              const Color(0xFFA855F7).withValues(alpha: 0.04),
                            ],
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.map_rounded,
                        size: 40,
                        color: Color(0xFFA855F7),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(roadmapCategories.length, (index) {
            const colors = [
              Color(0xFF60A5FA),
              Color(0xFFA855F7),
              Color(0xFFF59E0B),
              Color(0xFF34D399),
            ];
            return _ExpandableRoadmapCategory(
              key: _categoryKeys[index],
              category: roadmapCategories[index],
              accent: colors[index % colors.length],
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ExpandableRoadmapCategory extends StatefulWidget {
  final RoadmapCategory category;
  final Color accent;

  const _ExpandableRoadmapCategory({
    super.key,
    required this.category,
    required this.accent,
  });

  @override
  State<_ExpandableRoadmapCategory> createState() =>
      _ExpandableRoadmapCategoryState();
}

class _ExpandableRoadmapCategoryState
    extends State<_ExpandableRoadmapCategory> {
  bool _isExpanded = false;
  final Set<String> _checkedItems = {};
  final Set<int> _expandedSteps = {};

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  String _itemKey(int stepIndex, int descIndex) {
    return '${widget.category.title}_${stepIndex}_$descIndex';
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final savedItems = <String>{};

    for (
      int stepIndex = 0;
      stepIndex < widget.category.steps.length;
      stepIndex++
    ) {
      final step = widget.category.steps[stepIndex];

      for (
        int descIndex = 0;
        descIndex < step.descriptions.length;
        descIndex++
      ) {
        final key = _itemKey(stepIndex, descIndex);

        if (prefs.getBool(key) == true) {
          savedItems.add(key);
        }
      }
    }

    setState(() {
      _checkedItems
        ..clear()
        ..addAll(savedItems);

      _expandedSteps.clear();

      for (
        int stepIndex = 0;
        stepIndex < widget.category.steps.length;
        stepIndex++
      ) {
        if (!_isStepCompleted(stepIndex)) {
          _expandedSteps.add(stepIndex);
        }
      }
    });
  }

  Future<void> _toggleItem({
    required int stepIndex,
    required int descIndex,
    required bool value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _itemKey(stepIndex, descIndex);

    await prefs.setBool(key, value);

    setState(() {
      if (value) {
        _checkedItems.add(key);
      } else {
        _checkedItems.remove(key);
      }

      if (_isStepCompleted(stepIndex)) {
        _expandedSteps.remove(stepIndex);
      } else {
        _expandedSteps.add(stepIndex);
      }
    });
  }

  bool _isStepCompleted(int stepIndex) {
    final step = widget.category.steps[stepIndex];

    return step.descriptions.asMap().entries.every((entry) {
      final descIndex = entry.key;
      return _checkedItems.contains(_itemKey(stepIndex, descIndex));
    });
  }

  bool _isCategoryCompleted() {
    return widget.category.steps.asMap().entries.every((entry) {
      return _isStepCompleted(entry.key);
    });
  }

  void expand() {
    if (!_isExpanded) {
      setState(() {
        _isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: widget.accent.withValues(alpha: 0.12),
                      border: Border.all(
                        color: widget.accent.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_right_rounded,
                        color: widget.accent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.category.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  if (_isCategoryCompleted())
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x1A34D399),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: const Color(0x3334D399)),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            size: 14,
                            color: Color(0xFF34D399),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Tamamlandı',
                            style: TextStyle(
                              color: Color(0xFF34D399),
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (_isExpanded) ...[
              const SizedBox(height: 16),
              ...widget.category.steps.asMap().entries.map(
                (entry) => _buildStepItem(entry.key, entry.value),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem(int stepIndex, RoadmapStep step) {
    final stepCompleted = _isStepCompleted(stepIndex);
    final isStepExpanded = _expandedSteps.contains(stepIndex);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: stepCompleted
                ? const Color(0x3334D399)
                : widget.accent.withValues(alpha: 0.18),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (isStepExpanded) {
                    _expandedSteps.remove(stepIndex);
                  } else {
                    _expandedSteps.add(stepIndex);
                  }
                });
              },
              child: Row(
                children: [
                  Icon(
                    isStepExpanded
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_right_rounded,
                    color: stepCompleted
                        ? const Color(0xFF34D399)
                        : widget.accent,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      step.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: stepCompleted
                            ? const Color(0xFF34D399)
                            : widget.accent,
                      ),
                    ),
                  ),
                  if (stepCompleted)
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 18,
                      color: Color(0xFF34D399),
                    ),
                ],
              ),
            ),
            if (isStepExpanded) ...[
              const SizedBox(height: 10),
              ...step.descriptions.asMap().entries.map((entry) {
                final descIndex = entry.key;
                final desc = entry.value;
                final key = _itemKey(stepIndex, descIndex);
                final checked = _checkedItems.contains(key);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: Checkbox(
                          value: checked,
                          activeColor: widget.accent,
                          side: const BorderSide(
                            color: Color(0xFF9CA3AF),
                            width: 1.4,
                          ),
                          onChanged: (value) {
                            _toggleItem(
                              stepIndex: stepIndex,
                              descIndex: descIndex,
                              value: value ?? false,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          desc,
                          style: TextStyle(
                            color: checked
                                ? const Color(0xFF6B7280)
                                : const Color(0xFF9CA3AF),
                            fontSize: 12,
                            height: 1.5,
                            decoration: checked
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }
}
