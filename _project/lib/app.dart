import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/app_localizations.dart';
import 'pages/home_page.dart';
import 'utils/build_context_ext.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.strings.surname,
      home: const HomePage(),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      builder: _buildApp,
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.ralewayTextTheme(baseTheme.textTheme),
    );
  }

  Widget _buildApp(BuildContext context, Widget? child) {
    Widget wrappedChild = child!;

    if (kDebugMode) {
      final screenSize = MediaQuery.of(context).size;
      final screenSizeText = '${screenSize.width}x${screenSize.height}';
      wrappedChild = Banner(
        message: screenSizeText,
        location: BannerLocation.bottomEnd,
        child: wrappedChild,
      );
    }

    return wrappedChild;
  }
}
