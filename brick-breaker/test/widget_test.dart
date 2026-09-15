import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:brick_breaker/screens/home_screen.dart';
import 'package:brick_breaker/settings/game_settings.dart';
import 'package:brick_breaker/theme/arcade_theme.dart';

void main() {
  testWidgets('mostra o menu inicial em Dart', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => GameSettings(),
        child: MaterialApp(
          theme: ArcadeTheme.dark,
          home: const HomeScreen(),
        ),
      ),
    );

    expect(find.textContaining('BRICK'), findsWidgets);
    expect(find.text('JOGAR'), findsOneWidget);
    expect(find.text('INTEGRANTES'), findsOneWidget);
    expect(find.text('CONFIGURAÇÕES'), findsOneWidget);
  });
}
