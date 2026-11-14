import 'package:flutter/material.dart';
import '../widgets/page_content.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PageContent(children: [
      Icon(Icons.waving_hand_outlined,
          size: 56, color: theme.colorScheme.primary),
      const SizedBox(height: 24),
      Text('Contact us',
          style: theme.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Text('Have an idea for Blue Trails? We would love to hear it.',
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.6)),
      const SizedBox(height: 28),
      const InfoTile(
          icon: Icons.email_outlined,
          title: 'Email',
          subtitle: 'hello@bluetrails.example'),
      const InfoTile(
          icon: Icons.location_on_outlined,
          title: 'Find us',
          subtitle: 'Delta University, Egypt'),
      const SizedBox(height: 12),
      Text('This is a student demo. The email address is a placeholder.',
          style: theme.textTheme.bodySmall),
    ]);
  }
}
