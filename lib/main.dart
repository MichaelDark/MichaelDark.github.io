import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  usePathUrlStrategy();
  runApp(const AboutMeApp());
}

class AboutMeApp extends StatelessWidget {
  const AboutMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michael Dark',
      builder: _buildApp,
      theme: _buildTheme(Brightness.dark),
      home: const AboutMePage(),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
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

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Michael Dark'),
      ),
    );
  }
}
