import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

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
                      const Text('Mobil Uygulama\nGeliştirme', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.05, letterSpacing: -0.7)),
                      const SizedBox(height: 10),
                      const Text('Hedefe göre hazırlanmış ilerleme planı.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 14),
                      FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: const Color(0xFFA855F7), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Başla', style: TextStyle(fontWeight: FontWeight.w900))),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(width: 92, height: 92, child: Stack(alignment: Alignment.center, children: [Container(decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Colors.white.withValues(alpha: 0.18), const Color(0xFFA855F7).withValues(alpha: 0.04)]))), const Icon(Icons.map_rounded, size: 40, color: Color(0xFFA855F7))])),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _StepCard(step: 1, title: 'Temel Flutter', subtitle: 'Widget yapısı ve layout mantığı', accent: Color(0xFF60A5FA), done: true),
          const _StepCard(step: 2, title: 'State Yönetimi', subtitle: 'setState, provider ve veri akışı', accent: Color(0xFFA855F7), done: true),
          const _StepCard(step: 3, title: 'API Entegrasyonu', subtitle: 'Uzak veriyi ekrana taşı', accent: Color(0xFFF59E0B), done: false),
          const _StepCard(step: 4, title: 'Yayınlama', subtitle: 'APK ve mağaza hazırlığı', accent: Color(0xFF34D399), done: false),
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

class _StepCard extends StatelessWidget {
  const _StepCard({required this.step, required this.title, required this.subtitle, required this.accent, required this.done});

  final int step;
  final String title;
  final String subtitle;
  final Color accent;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: accent.withValues(alpha: 0.12), border: Border.all(color: accent.withValues(alpha: 0.2))),
              child: Center(child: done ? Icon(Icons.check_rounded, color: accent) : Text('$step', style: TextStyle(color: accent, fontWeight: FontWeight.w900))),
            ),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600))])),
            const SizedBox(width: 12),
            Icon(Icons.chevron_right_rounded, color: done ? accent : const Color(0xFF4B5563)),
          ],
        ),
      ),
    );
  }
}
