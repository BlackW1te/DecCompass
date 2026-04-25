import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Projeler', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -1)), Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(borderRadius: BorderRadius.circular(999), color: const Color(0x14A855F7), border: Border.all(color: Color(0x33A855F7))), child: const Text('TOPLAM: 12', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFFCB9BFF), letterSpacing: 1)))]),
          const SizedBox(height: 6),
          const Text('Hedefe uygun projeler ve pratik görevler.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 18),
          GlassCard(
            gradient: const LinearGradient(colors: [Color(0x331E3A8A), Color(0x22000000)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SANA ÖZEL ÖNERİ', style: TextStyle(color: Color(0xFF818CF8), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2)),
                    const SizedBox(height: 12),
                    const Text('Hava Durumu\nUygulaması', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.0, letterSpacing: -0.8)),
                    const SizedBox(height: 10),
                    const SizedBox(width: 210, child: Text('API kullanarak anlık hava durumu bilgilerini gösteren modern bir mobil uygulama geliştir.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600, height: 1.5))),
                    const SizedBox(height: 12),
                    const Row(children: [Pill(label: 'Flutter', color: Color(0xFF8B5CF6)), SizedBox(width: 8), Pill(label: 'API', color: Color(0xFF38BDF8))]),
                    const SizedBox(height: 16),
                    FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, minimumSize: const Size.fromHeight(50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))), child: const Text('Projeyi Gör', style: TextStyle(fontWeight: FontWeight.w900))),
                  ],
                ),
                Positioned(
                  top: 6,
                  right: -18,
                  child: Transform.rotate(
                    angle: 0.2,
                    child: Container(
                      width: 118,
                      height: 190,
                      decoration: BoxDecoration(color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 6)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          children: const [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Icon(Icons.search_rounded, size: 12, color: Color(0xFF64748B)), Icon(Icons.notifications_none_rounded, size: 12, color: Color(0xFF64748B))]),
                            SizedBox(height: 16),
                            Text('İstanbul', style: TextStyle(fontSize: 9, color: Color(0xFF94A3B8), fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                            SizedBox(height: 8),
                            Text('24°C', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                            SizedBox(height: 4),
                            Text('Sisli ve Parçalı', style: TextStyle(fontSize: 8, color: Color(0xFF38BDF8), fontWeight: FontWeight.w700)),
                            Spacer(),
                            Icon(Icons.cloud_rounded, size: 34, color: Color(0xFF3B82F6)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 54,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                _FilterChip(label: 'Tümü', active: true),
                _FilterChip(label: 'Mobil'),
                _FilterChip(label: 'Web'),
                _FilterChip(label: 'Veri'),
                _FilterChip(label: 'Oyun'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const _ProjectItem(title: 'To-Do List Uygulaması', tags: ['Flutter', 'Başlangıç'], icon: Icons.grid_view_rounded, accent: Color(0xFF818CF8), status: 'İşlem Gerekli'),
          const SizedBox(height: 12),
          const _ProjectItem(title: 'Tarif Defteri Uygulaması', tags: ['Flutter', 'Orta'], icon: Icons.menu_book_rounded, accent: Color(0xFF34D399), status: 'İşlem Gerekli'),
          const SizedBox(height: 12),
          const _ProjectItem(title: 'Chat Uygulaması', tags: ['React Native', 'İleri'], icon: Icons.forum_rounded, accent: Color(0xFF38BDF8), status: 'İşlem Gerekli'),
        ],
      ),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  const _ProjectItem({required this.title, required this.tags, required this.icon, required this.accent, required this.status});

  final String title;
  final List<String> tags;
  final IconData icon;
  final Color accent;
  final String status;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          Container(width: 52, height: 52, decoration: BoxDecoration(color: accent.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(16), border: Border.all(color: accent.withValues(alpha: 0.18))), child: Icon(icon, color: accent)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: tags.map((tag) => Pill(label: tag, color: const Color(0xFF6B7280))).toList()),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('İşlem Gerekli', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFFA855F7), letterSpacing: 1)),
              const SizedBox(height: 10),
              OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFFA855F7), side: const BorderSide(color: Color(0x33A855F7)), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), child: const Text('BAŞLA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1))),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.active = false});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(color: active ? const Color(0xFFA855F7) : const Color(0x0AFFFFFF), borderRadius: BorderRadius.circular(999), border: Border.all(color: active ? const Color(0x22A855F7) : const Color(0x12FFFFFF))),
        child: Text(label, style: TextStyle(color: active ? Colors.white : const Color(0xFF9CA3AF), fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.4)),
      ),
    );
  }
}
