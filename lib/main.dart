import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      textTheme: GoogleFonts.chakraPetchTextTheme(baseTheme.textTheme),
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
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth > 1200 ? 1200 : 700;
          final int columns = constraints.maxWidth > 1200 ? 3 : 2;

          return SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Michael Dark',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: Links(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: MasonryGridView.count(
                              crossAxisCount: columns,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              shrinkWrap: true,
                              itemCount: sections.length,
                              itemBuilder: (_, index) {
                                return Section(sections[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Links extends StatelessWidget {
  const Links({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: [
        Link(
          label: 'github profile',
          url: 'https://github.com/MichaelDark',
        ),
        Link(
          label: 'gitlab profile',
          url: 'https://gitlab.com/MichaelDark',
        ),
        Link(
          label: 'linkedin profile',
          url: 'https://www.linkedin.com/in/michaeldark/',
        ),
        Link(
          label: 'pub dev packages',
          url: 'https://pub.dev/publishers/michaeldark.dev/packages',
        ),
      ],
    );
  }
}

class Link extends StatelessWidget {
  final String label;
  final String url;

  const Link({
    super.key,
    required this.label,
    required this.url,
  });

  VoidCallback _goTo(String url) => () => launchUrlString(url);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _goTo(url),
        child: Text(
          label,
          style: const TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class SectionData {
  final String title;
  final List<String> items;

  const SectionData({
    required this.title,
    required this.items,
  });
}

const sections = [
  SectionData(
    title: 'languages',
    items: [
      'ukrainian (native)',
      'russian (native)',
      'english (advanced)',
    ],
  ),
  SectionData(
    title: 'programming languages',
    items: [
      'Dart',
      'Kotlin',
      'Java',
      'Swift',
      'Groovy',
      'TypeScript (occasionally)',
      'C# (occasionally)',
      'Bash (occasionally)',
      'Python (occasionally)',
    ],
  ),
  SectionData(
    title: 'tech',
    items: [
      'Android SDK',
      'Flutter SDK',
      'Flutter Web SDK',
      'REST API',
    ],
  ),
  SectionData(
    title: 'strongly believe',
    items: [
      'SOLID',
      'KISS',
      'DRY',
      'YAGNI',
    ],
  ),
  SectionData(
    title: 'dev tools',
    items: [
      'Visual Studio Code',
      'Android Studio',
      'XCode',
      'GitKraken',
    ],
  ),
  SectionData(
    title: 'apis',
    items: [
      'Google API',
      "Google Play Billing API",
      "StoreKit InApp Purchase",
      'Firebase',
      'Sentry',
      'AWS S3',
      'REST API',
      'Adapty',
      'RevenueCat',
    ],
  ),
  SectionData(
    title: 'vcs',
    items: [
      'git',
      'Github',
      'GitLab',
      'BitBucket',
    ],
  ),
  SectionData(
    title: 'ci/cd',
    items: [
      'Github Actions',
      'GitLab Runner',
      'Jenkins',
      'Bitrise',
      'CodeMagic',
      'TestFlight',
      'MS AppCenter',
      'BitBucket',
    ],
  ),
  SectionData(
    title: 'dbms',
    items: [
      'SQLite',
      'SQLCipher',
      'Realm',
      'Flutter sqflite',
      'Flutter drift',
      'PostgreSQL',
      'MS SQL',
    ],
  ),
  SectionData(
    title: 'management',
    items: [
      'Jira',
      'Trello',
      'YouTracker',
      'PivotalTracker',
      'OpenProject',
      'Azure DevOps',
    ],
  ),
  SectionData(
    title: 'responsibilities',
    items: [
      'requirements analysis',
      'planning / design',
      'development',
      'team leading',
      'testing and QA',
      'delivery',
      'maintenance and support',
    ],
  ),
];

class Section extends StatelessWidget {
  final SectionData section;

  const Section(
    this.section, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        for (final item in section.items) ...[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '• $item',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ],
    );
  }
}
