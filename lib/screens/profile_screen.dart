import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          const Text('Profil', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -1)),
          const SizedBox(height: 18),
          GlassCard(
            gradient: LinearGradient(colors: [const Color(0x33A855F7), Colors.transparent], begin: Alignment.topLeft, end: Alignment.bottomRight),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(width: 84, height: 84, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0x66A855F7), width: 2), color: const Color(0x22000000)), child: const CircleAvatar(backgroundColor: Color(0xFF1E1B4B), child: Icon(Icons.person_rounded, size: 42, color: Color(0xFFD8B4FE)))),
                        Positioned(right: 0, bottom: 2, child: Container(width: 24, height: 24, decoration: const BoxDecoration(color: Color(0xFFA855F7), shape: BoxShape.circle), child: const Icon(Icons.local_fire_department_rounded, size: 14, color: Colors.white))),
                      ],
                    ),
                    const SizedBox(width: 16),
                    const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Ahmet Yılmaz', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.8)), SizedBox(height: 4), Text('Backend Specialist', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF), fontWeight: FontWeight.w900, letterSpacing: 1.6))])),
                  ],
                ),
                const SizedBox(height: 18),
                const Row(
                  children: [
                    Expanded(child: _MetricTile(label: 'PROJE', value: '12', icon: Icons.folder_open_rounded)),
                    SizedBox(width: 8),
                    Expanded(child: _MetricTile(label: 'SERİ', value: '28', icon: Icons.local_fire_department_rounded)),
                    SizedBox(width: 8),
                    Expanded(child: _MetricTile(label: 'ROZET', value: '4', icon: Icons.emoji_events_rounded)),
                    SizedBox(width: 8),
                    Expanded(child: _MetricTile(label: 'ORAN', value: '%82', icon: Icons.bar_chart_rounded)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('Profil Özeti', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: -0.4)),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: const [
              ProgressCard(label: 'Kod Bilgisi', value: 0.50, level: 'Orta', start: Color(0xFFA855F7), end: Color(0xFF3B82F6)),
              ProgressCard(label: 'Algoritma', value: 0.60, level: 'İleri', start: Color(0xFF3B82F6), end: Color(0xFF06B6D4)),
              ProgressCard(label: 'Takım Uyumu', value: 0.85, level: 'Yüksek', start: Color(0xFF34D399), end: Color(0xFF14B8A6)),
              ProgressCard(label: 'İngilizce', value: 0.45, level: 'Orta', start: Color(0xFFF59E0B), end: Color(0xFFEF4444)),
            ],
          ),
          const SizedBox(height: 18),
          const Text('Yetenek Profili', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: -0.4)),
          const SizedBox(height: 12),
          GlassCard(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final side = constraints.maxWidth;
                return SizedBox(
                  width: side,
                  height: side,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(size: Size.square(side), painter: _RadarPainter()),
                      const Positioned(top: 4, left: 0, right: 0, child: Center(child: _SkillLabel(text: 'KODLAMA'))),
                      const Positioned(right: 0, top: 0, bottom: 0, child: Center(child: _SkillLabel(text: 'ALGORİTMA'))),
                      const Positioned(bottom: 4, right: 18, child: _SkillLabel(text: 'TAKIM')),
                      const Positioned(bottom: 4, left: 18, child: _SkillLabel(text: 'İNGİLİZCE')),
                      const Positioned(left: 0, top: 0, bottom: 0, child: Center(child: _SkillLabel(text: 'PROBLEM'))),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          const GlassCard(
            child: Column(
              children: [
                _SettingsRow(icon: Icons.person_rounded, label: 'Hesap Bilgileri'),
                SizedBox(height: 10),
                _SettingsRow(icon: Icons.lock_rounded, label: 'Gizlilik ve Güvenlik'),
                SizedBox(height: 10),
                _SettingsRow(icon: Icons.notifications_rounded, label: 'Bildirim Ayarları'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(color: const Color(0x0AFFFFFF), borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0x12FFFFFF))),
      child: Column(children: [Icon(icon, size: 16, color: const Color(0xFFA855F7)), const SizedBox(height: 8), Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)), const SizedBox(height: 2), Text(label, style: const TextStyle(fontSize: 8, color: Color(0xFF6B7280), fontWeight: FontWeight.w900, letterSpacing: 1.2))]),
    );
  }
}

class _RadarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outline = Paint()..color = const Color(0xFFA855F7)..style = PaintingStyle.stroke..strokeWidth = 2;
    final line = Paint()..color = const Color(0x14FFFFFF)..strokeWidth = 1;
    final ring = Paint()..color = const Color(0x14FFFFFF)..style = PaintingStyle.stroke..strokeWidth = 1;
    final polygon = Path()
      ..moveTo(center.dx, center.dy - size.width * 0.34)
      ..lineTo(center.dx + size.width * 0.27, center.dy - size.height * 0.08)
      ..lineTo(center.dx + size.width * 0.18, center.dy + size.height * 0.28)
      ..lineTo(center.dx - size.width * 0.2, center.dy + size.height * 0.28)
      ..lineTo(center.dx - size.width * 0.28, center.dy - size.height * 0.02)
      ..close();
    canvas.drawCircle(center, size.width * 0.42, ring);
    canvas.drawCircle(center, size.width * 0.29, ring);
    canvas.drawCircle(center, size.width * 0.16, ring);
    canvas.drawLine(Offset(center.dx, 0), Offset(center.dx, size.height), line);
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), line);
    canvas.drawPath(polygon, outline);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SkillLabel extends StatelessWidget {
  const _SkillLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1.5));
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Container(width: 44, height: 44, decoration: BoxDecoration(color: const Color(0x0AFFFFFF), borderRadius: BorderRadius.circular(14)), child: Icon(icon, size: 20, color: const Color(0xFF9CA3AF))), const SizedBox(width: 12), Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFE5E7EB)))]), const Icon(Icons.chevron_right_rounded, color: Color(0xFF374151))]);
  }
}
