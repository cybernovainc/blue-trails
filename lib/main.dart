import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';

void main() => runApp(const BlueTrailsApp());

class BlueTrailsApp extends StatefulWidget {
  const BlueTrailsApp({super.key});

  @override
  State<BlueTrailsApp> createState() => _BlueTrailsAppState();
}

class _BlueTrailsAppState extends State<BlueTrailsApp> {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeData _theme(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF1976D2),
      brightness: brightness,
    ).copyWith(
      primary: dark ? const Color(0xFF90CAF9) : const Color(0xFF1565C0),
      secondary: dark ? const Color(0xFF64B5F6) : const Color(0xFF1976D2),
      tertiary: dark ? const Color(0xFF81D4FA) : const Color(0xFF0277BD),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          dark ? const Color(0xFF0B1422) : const Color(0xFFF4F8FD),
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Blue Trails',
        debugShowCheckedModeBanner: false,
        theme: _theme(Brightness.light),
        darkTheme: _theme(Brightness.dark),
        themeMode: _themeMode,
        home: AppShell(
          onToggleTheme: (isDark) => setState(() {
            _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
          }),
        ),
      );
}

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.onToggleTheme});

  final ValueChanged<bool> onToggleTheme;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;
  static const _titles = ['Home', 'About', 'Contact'];

  void _selectPage(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
        actions: [
          IconButton(
            tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
            onPressed: () => widget.onToggleTheme(isDark),
            icon: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _index,
          children: [
            HomePage(onAbout: () => _selectPage(1)),
            AboutPage(onContact: () => _selectPage(2)),
            const ContactPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              activeIcon: Icon(Icons.info),
              label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline),
              activeIcon: Icon(Icons.mail),
              label: 'Contact'),
        ],
      ),
    );
  }
}
