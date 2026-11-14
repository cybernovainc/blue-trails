import 'package:blue_trails/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Page buttons, bottom navigation, and theme toggle work',
      (tester) async {
    await tester.pumpWidget(const BlueTrailsApp());
    await tester.pumpAndSettle();

    expect(find.byType(Image), findsOneWidget);
    await tester.ensureVisible(find.text('About Blue Trails').first);
    await tester.tap(find.text('About Blue Trails'));
    await tester.pumpAndSettle();
    expect(find.text('About Blue Trails'), findsOneWidget);

    await tester.ensureVisible(find.text('Go to Contact'));
    await tester.tap(find.text('Go to Contact'));
    await tester.pumpAndSettle();
    expect(find.text('Contact us'), findsOneWidget);

    await tester.tap(find.text('Home').last);
    await tester.pumpAndSettle();
    expect(find.text('A little curiosity.\nA new adventure.'), findsOneWidget);

    await tester.tap(find.byTooltip('Switch to dark theme'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Switch to light theme'), findsOneWidget);
    await tester.tap(find.byTooltip('Switch to light theme'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Switch to dark theme'), findsOneWidget);
  });
}
