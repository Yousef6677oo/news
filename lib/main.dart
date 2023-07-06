import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news/view/article/article_view.dart';
import 'package:news/view/home/home_view.dart';
import 'package:news/view/settings/settings_view.dart';
import 'package:news/view/splash/splash_view.dart';

import 'core/utilities/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightThem,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightThem,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'), // English
        ],
        locale: const Locale("en"),
        routes: {
          SplashView.routeName: (_) => SplashView(),
          HomeView.routeName: (_) => HomeView(),
          SettingsView.routeName: (_) => SettingsView(),
          ArticleView.routeName: (_) => ArticleView(),
        },
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
