import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

import '../screens/team_cohesion_test_screen.dart';

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
          const SizedBox(height: 4),
          Text(
            'Merhaba, Ahmet 👋',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: compact ? 24 : 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Yazılım kariyer yolculuğuna devam et!',
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.3,
            ),
          ),
          const SizedBox(height: 18),
          const _HeroCard(),
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
                  match: 74,
                  icon: Icons.language_rounded,
                  accent: Color(0xFF60A5FA),
                ),
                _AltFieldCard(
                  name: 'Oyun Geliştirme',
                  match: 63,
                  icon: Icons.sports_esports_rounded,
                  accent: Color(0xFFA855F7),
                ),
                _AltFieldCard(
                  name: 'Veri Bilimi',
                  match: 58,
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

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
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
              const Text(
                'ÖNERİLEN ALANIN',
                style: TextStyle(
                  color: Color(0xFFA855F7),
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Mobil Uygulama\nGeliştirme',
                style: TextStyle(
                  fontSize: 26,
                  height: 1.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const _MatchRing(value: 0.82),
                  const SizedBox(width: 12),
                  const Text(
                    'Eşleşme',
                    style: TextStyle(
                      color: Color(0xFFD8B4FE),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Profiline en uygun alan bu!',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),
              const _TextAction(
                label: 'Yol Haritasını Gör',
                icon: Icons.arrow_forward_rounded,
                accent: Color(0xFFA855F7),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MatchRing extends StatelessWidget {
  const _MatchRing({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: _RingPainter(
              background: const Color(0x14FFFFFF),
              foreground: const Color(0xFFA855F7),
              value: value,
            ),
            size: const Size.square(46),
          ),
          Text(
            '${(value * 100).round()}%',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.background,
    required this.foreground,
    required this.value,
  });

  final Color background;
  final Color foreground;
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 3;
    final basePaint = Paint()
      ..color = background
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final progressPaint = Paint()
      ..color = foreground
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, basePaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708,
      value * 6.28318,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.background != background ||
      oldDelegate.foreground != foreground;
}

class _DailyTaskCard extends StatelessWidget {
  const _DailyTaskCard();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
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
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter ile basit bir To-Do uygulaması yap',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                Text(
                  '2 / 5 ADIM TAMAMLANDI',
                  style: TextStyle(
                    fontSize: 9,
                    color: Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                  child: LinearProgressIndicator(
                    value: 0.4,
                    minHeight: 6,
                    backgroundColor: Color(0x0DFFFFFF),
                    valueColor: AlwaysStoppedAnimation(Color(0xFF3B82F6)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Devam Et',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class _AltFieldCard extends StatelessWidget {
  const _AltFieldCard({
    required this.name,
    required this.match,
    required this.icon,
    required this.accent,
  });

  final String name;
  final int match;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
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
                      color: accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: accent.withValues(alpha: 0.25)),
                    ),
                    child: Icon(icon, size: 18, color: accent),
                  ),
                  Text(
                    '%$match',
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
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Eşleşme',
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
    );
  }
}

class _TextAction extends StatelessWidget {
  const _TextAction({
    required this.label,
    required this.icon,
    required this.accent,
  });

  final String label;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          MaterialPageRoute(
            builder: (context) => const TeamCohesionTestScreen(),
          ),
        );
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
