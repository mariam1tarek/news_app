import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/news/view/screen/main_screen.dart';
import 'common/app_strings.dart';
import 'common/app_theme.dart';
import 'common/language_controller.dart';
import 'common/theme_controller.dart';

void main() {
  AppStrings.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeController.themeMode,
        builder: (context, mode, _) => ValueListenableBuilder<Locale>(
          valueListenable: LanguageController.locale,
          builder: (context, locale, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            locale: locale,
            supportedLocales: LanguageController.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const MainScreen(),
          ),
        ),
      ),
    );
  }
}
