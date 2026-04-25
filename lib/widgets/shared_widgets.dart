import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child, this.padding = const EdgeInsets.all(16), this.gradient});

  final Widget child;
  final EdgeInsets padding;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            gradient: gradient ?? LinearGradient(colors: [Colors.white.withValues(alpha: 0.04), Colors.white.withValues(alpha: 0.02)]),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 24, offset: const Offset(0, 12))],
          ),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.action, required this.onTap});

  final String title;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: -0.4)),
        TextButton.icon(
          onPressed: onTap,
          style: TextButton.styleFrom(foregroundColor: const Color(0xFF8B8B8B)),
          icon: const Icon(Icons.chevron_right_rounded, size: 16, color: Color(0xFFA855F7)),
          label: Text(action, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
        ),
      ],
    );
  }
}

class Pill extends StatelessWidget {
  const Pill({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: color)),
    );
  }
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, required this.label, required this.value, required this.level, required this.start, required this.end});

  final String label;
  final double value;
  final String level;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFFB8B8B8)))),
              Text('${(value * 100).round()}%', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 10),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutCubic,
            builder: (context, animated, _) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: Stack(
                  children: [
                    Container(height: 8, color: const Color(0x0DFFFFFF)),
                    FractionallySizedBox(
                      widthFactor: animated,
                      child: Container(height: 8, decoration: BoxDecoration(gradient: LinearGradient(colors: [start, end]))),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(level.toUpperCase(), style: const TextStyle(fontSize: 9, color: Color(0xFF6B7280), fontWeight: FontWeight.w900, letterSpacing: 2)),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({super.key, required this.label, required this.icon, required this.active, required this.onTap});

  final String label;
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: active ? const Color(0x1AA855F7) : Colors.transparent, borderRadius: BorderRadius.circular(16)),
              child: Icon(icon, size: 24, color: active ? const Color(0xFFA855F7) : const Color(0xFF6B7280)),
            ),
            const SizedBox(height: 5),
            Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0.6, color: active ? const Color(0xFFA855F7) : const Color(0xFF6B7280))),
          ],
        ),
      ),
    );
  }
}
