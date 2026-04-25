import 'dart:ui';

import 'package:flutter/material.dart';

import 'shared_widgets.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  static const _titles = ['Ana Sayfa', 'Yol Haritası', 'Projeler', 'Profil'];

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    const bottomContentPadding = 0.0;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          const _Backdrop(),
          SafeArea(
            bottom: false,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 390;
                final horizontal = compact ? 16.0 : 20.0;

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(horizontal, 8, horizontal, 10),
                      child: _TopBar(title: _titles[_index]),
                    ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 220),
                        child: Padding(
                          key: ValueKey(_index),
                          padding: EdgeInsets.fromLTRB(horizontal, 0, horizontal, bottomContentPadding + bottomInset),
                          child: widget.tabs[_index],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRect(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 12 + bottomInset),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                decoration: BoxDecoration(
                  color: const Color(0x4D050505),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem(label: 'Ana Sayfa', icon: Icons.home_rounded, active: _index == 0, onTap: () => setState(() => _index = 0)),
                    BottomNavItem(label: 'Harita', icon: Icons.map_rounded, active: _index == 1, onTap: () => setState(() => _index = 1)),
                    BottomNavItem(label: 'Projeler', icon: Icons.work_rounded, active: _index == 2, onTap: () => setState(() => _index = 2)),
                    BottomNavItem(label: 'Profil', icon: Icons.person_rounded, active: _index == 3, onTap: () => setState(() => _index = 3)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconButton(icon: Icons.menu_rounded, onTap: () {}),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            children: [
              Text('DevCompass', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.8)),
              const SizedBox(height: 2),
              Text(title, style: const TextStyle(color: Color(0xFF8B8B8B), fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 2)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Stack(
          clipBehavior: Clip.none,
          children: [
            _IconButton(icon: Icons.notifications_none_rounded, onTap: () {}),
            Positioned(
              right: 12,
              top: 12,
              child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFFEF4444), shape: BoxShape.circle)),
            ),
          ],
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0x14FFFFFF),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(width: 50, height: 50, child: Icon(icon, color: const Color(0xFF9CA3AF))),
      ),
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFF050505)),
          child: Stack(
          children: [
            _Glow(top: -120, left: -60, size: 280, color: Color(0x1AA855F7)),
            _Glow(bottom: -120, right: -80, size: 320, color: Color(0x1A2563EB)),
            _Glow(top: 240, left: -100, size: 220, color: Color(0x1022C55E)),
            _Glow(bottom: 120, left: 20, size: 200, color: Color(0x0F8B5CF6)),
            _Glow(bottom: 40, right: 20, size: 180, color: Color(0x0F38BDF8)),
          ],
        ),
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({this.top, this.bottom, this.left, this.right, required this.size, required this.color});

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
