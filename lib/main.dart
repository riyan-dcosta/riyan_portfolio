import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riyan_portfolio/features/home/controller/theme_changer.dart';
import 'package:riyan_portfolio/features/home/presentation/home_page.dart';
import 'package:riyan_portfolio/theme/text_theme.dart';
import 'package:riyan_portfolio/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late ThemeChanger themeChanger;

  @override
  void initState() {
    super.initState();
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    ThemeMode mode =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    themeChanger = ThemeChanger(mode);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeChanger,
      builder: (context, _) {
        final currentTheme = themeChanger.getCurrentTheme;
        return MaterialApp(
            themeAnimationStyle: AnimationStyle(
              curve: CatmullRomCurve(
                const [
                  Offset(0.1, 0.1),
                  Offset(0.2, 0.5),
                  Offset(0.3, 0.9),
                  Offset(0.4, 0.7),
                  // Offset(0.5, 0.2),
                  // Offset(0.6, 0.3),
                  // Offset(0.7, 0.1),
                ],
              ),
              duration: const Duration(seconds: 1),
            ),
            theme: const MaterialTheme(AppTextTheme.textTheme).light(),
            darkTheme: const MaterialTheme(AppTextTheme.textTheme).dark(),
            themeMode: currentTheme,
            home: HomePage(
              themeChanger: themeChanger,
            ));
      },
    );
  }
}
