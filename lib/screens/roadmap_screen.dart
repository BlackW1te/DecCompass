import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/roadmap_data.dart';
import '../widgets/shared_widgets.dart';

class RoadmapScreen extends StatefulWidget {
  const RoadmapScreen({super.key});

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  String _recommendedField = "Henüz Test Çözülmedi";
  late final List<GlobalKey<_ExpandableRoadmapCategoryState>> _categoryKeys;

  @override
  void initState() {
    super.initState();
    _categoryKeys = List.generate(roadmapCategories.length, (index) => GlobalKey<_ExpandableRoadmapCategoryState>());
    _loadRecommendedField();
  }

  String _mapTestResultToCategoryTitle(String result) {
    switch (result) {
      case "Web Geliştirme (Full-Stack)": return "Web Geliştirme (Full-Stack)";
      case "Mobil Uygulama Geliştirme": return "Mobil Uygulama Geliştirme";
      case "Yapay Zeka ve Makine Öğrenmesi": return "Yapay Zeka ve Makine Öğrenmesi";
      case "Veri Bilimi ve Büyük Veri": return "Veri Bilimi & Büyük Veri";
      case "Gömülü Sistemler ve IoT": return "Gömülü Sistemler ve IoT";
      case "Robotik ve Otomasyon": return "Robotik ve Otomasyon";
      case "Bulut Bilişim ve DevOps": return "Bulut Bilişim";
      case "Bilgisayar Ağları ve Sistem Yönetimi": return "Bilgisayar Ağları ve Sistem Yönetimi";
      case "Dijital Adli Bilişim ve Kriptografi": return "Dijital Adli Bilişim ve Kriptografi";
      case "Siber Güvenlik": return "Siber Güvenlik";
      case "Yazılım Mimarisi ve Proje Yönetimi": return "Yazılım Mimarisi ve Proje Yönetimi";
      case "Sanal ve Arttırılmış Gerçeklik (VR/AR)": return "Sanal ve Artırılmış Gerçeklik (VR/AR)";
      case "Oyun Geliştirme ve Grafik Programlama": return "Oyun Geliştirme";
      case "Blokzincir Teknolojileri": return "Blokzincir Teknolojileri";
      case "Donanım ve Mikroişlemci Tasarımı": return "Donanım ve Mikroişlemci Tasarımı";
      default: return "";
    }
  }

  void _onStartPressed() {
    String targetTitle = _mapTestResultToCategoryTitle(_recommendedField);
    int targetIndex = roadmapCategories.indexWhere((cat) => cat.title == targetTitle);
    
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

  Future<void> _loadRecommendedField() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recommendedField = prefs.getString('recommended_field') ?? "Henüz Test Çözülmedi";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          const Text('Yol Haritası', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -1)),
          const SizedBox(height: 6),
          const Text('Kişisel planını adım adım ilerlet.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 18),
          GlassCard(
            gradient: const LinearGradient(colors: [Color(0x331D4ED8), Color(0x22000000)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Önerilen Alan', style: TextStyle(color: Color(0xFF818CF8), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2)),
                      const SizedBox(height: 10),
                      Text(_recommendedField, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.05, letterSpacing: -0.7)),
                      const SizedBox(height: 10),
                      const Text('Hedefe göre hazırlanmış ilerleme planı.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 14),
                      FilledButton(onPressed: _onStartPressed, style: FilledButton.styleFrom(backgroundColor: const Color(0xFFA855F7), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Başla', style: TextStyle(fontWeight: FontWeight.w900))),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(width: 92, height: 92, child: Stack(alignment: Alignment.center, children: [Container(decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Colors.white.withValues(alpha: 0.18), const Color(0xFFA855F7).withValues(alpha: 0.04)]))), const Icon(Icons.map_rounded, size: 40, color: Color(0xFFA855F7))])),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(roadmapCategories.length, (index) {
            const colors = [Color(0xFF60A5FA), Color(0xFFA855F7), Color(0xFFF59E0B), Color(0xFF34D399)];
            return _ExpandableRoadmapCategory(
              key: _categoryKeys[index],
              category: roadmapCategories[index],
              accent: colors[index % colors.length],
            );
          }),
          const SizedBox(height: 18),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Sonraki Hedef', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                SizedBox(height: 10),
                Text('API çağrıları yapan küçük bir hava durumu uygulaması geliştir.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600)),
                SizedBox(height: 14),
                Row(children: [Pill(label: 'Flutter', color: Color(0xFF8B5CF6)), SizedBox(width: 8), Pill(label: 'API', color: Color(0xFF38BDF8)), SizedBox(width: 8), Pill(label: 'UI', color: Color(0xFF34D399))]),
              ],
            ),
          ),
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
  State<_ExpandableRoadmapCategory> createState() => _ExpandableRoadmapCategoryState();
}

class _ExpandableRoadmapCategoryState extends State<_ExpandableRoadmapCategory> {
  bool _isExpanded = false;

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
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: widget.accent.withValues(alpha: 0.12),
                      border: Border.all(color: widget.accent.withValues(alpha: 0.2)),
                    ),
                    child: Center(
                      child: Icon(
                        _isExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                        color: widget.accent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.category.title,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 16),
                ...widget.category.steps.map((step) => _buildStepItem(step)),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepItem(RoadmapStep step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: widget.accent),
          ),
          const SizedBox(height: 6),
          ...step.descriptions.map((desc) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("• ", style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, height: 1.5)),
                Expanded(child: Text(desc, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, height: 1.5))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
