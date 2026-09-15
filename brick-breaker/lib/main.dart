import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'settings/game_settings.dart';
import 'theme/arcade_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = GameSettings();
  await settings.load();
  runApp(BrickBreakerApp(settings: settings));
}

class BrickBreakerApp extends StatelessWidget {
  const BrickBreakerApp({super.key, required this.settings});

  final GameSettings settings;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: settings,
      child: MaterialApp(
        title: 'Brick Breaker',
        debugShowCheckedModeBanner: false,
        theme: ArcadeTheme.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
