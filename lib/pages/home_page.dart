import 'package:flutter/material.dart';
import '../widgets/page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onAbout});
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PageContent(children: [
      Row(children: [
        Icon(Icons.explore_outlined, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text('BLUE TRAILS',
            style: TextStyle(
                color: theme.colorScheme.primary,
                letterSpacing: 2,
                fontWeight: FontWeight.w700)),
      ]),
      const SizedBox(height: 24),
      Text('A little curiosity.\nA new adventure.',
          style: theme.textTheme.headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Text(
          'Welcome to Blue Trails, your simple travel companion. Find inspiration for your next day out.',
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.6)),
      const SizedBox(height: 24),
      ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset('assets/images/mountains.png',
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            semanticLabel: 'Blue mountain peaks beneath a clear sky'),
      ),
      const SizedBox(height: 20),
      const InfoTile(
          icon: Icons.landscape_outlined,
          title: 'Take the scenic route',
          subtitle: 'Start small. Explore somewhere close to home.'),
      const SizedBox(height: 12),
      FilledButton.icon(
          onPressed: onAbout,
          icon: const Icon(Icons.arrow_forward),
          label: const Text('About Blue Trails')),
    ]);
  }
}
