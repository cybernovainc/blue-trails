import 'package:flutter/material.dart';
import '../widgets/page_content.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.onContact});
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PageContent(children: [
      Icon(Icons.explore, size: 56, color: theme.colorScheme.primary),
      const SizedBox(height: 24),
      Text('About Blue Trails',
          style: theme.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Text(
          'Travel starts with a simple idea: go somewhere new. Blue Trails is a small student project built around that idea.',
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.6)),
      const SizedBox(height: 28),
      const InfoTile(
          icon: Icons.map_outlined,
          title: 'Made for exploring',
          subtitle: 'A quiet space to find a little travel inspiration.'),
      const InfoTile(
          icon: Icons.palette_outlined,
          title: 'Comfort in every theme',
          subtitle:
              'Blue accents, with light and dark modes. Tap the icon at the top to switch.'),
      const SizedBox(height: 16),
      FilledButton.icon(
          onPressed: onContact,
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Go to Contact')),
    ]);
  }
}
