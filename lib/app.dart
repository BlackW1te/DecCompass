import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/roadmap_screen.dart';
import 'widgets/app_shell.dart';

class DevCompassApp extends StatelessWidget {
  const DevCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevCompass',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA855F7),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF050505),
      ),
      home: const AppShell(
        tabs: [
          HomeScreen(),
          RoadmapScreen(),
          ProjectsScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
