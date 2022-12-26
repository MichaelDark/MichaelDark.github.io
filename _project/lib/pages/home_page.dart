import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';
import '../gen/assets.gen.dart';
import '../gen/skills.gen.dart';
import '../gen/work_projects.gen.dart';
import '../utils/build_context_ext.dart';
import '../utils/color_ext.dart';
import '../utils/preferences.dart';
import 'views/skills_overview.dart';
import 'views/social_button.dart';
import 'views/work_project_timeline.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String getSeamlessBgImagePath(BuildContext context) {
    switch (context.theme.brightness) {
      case Brightness.dark:
        return Assets.images.bgSeamlessDark.path;
      case Brightness.light:
        return Assets.images.bgSeamless.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              getSeamlessBgImagePath(context),
              repeat: ImageRepeat.repeat,
              filterQuality: globalFilterQuality,
            ),
          ),
          Positioned.fill(
            child: SizedBox.expand(
              child: ColoredBox(
                color: context.theme.colorScheme.background.withOpacity(0.85),
              ),
            ),
          ),
          _buildContent(context),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              onPressed: () {
                final brightness = Theme.of(context).brightness;
                Preferences.instance.setBrightness(
                  brightness == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark,
                );
              },
              icon: const Icon(Icons.brightness_medium),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final mq = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: mq.size.height - 84,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildName(context),
                      _buildRole(context),
                      const SizedBox(height: 24),
                      _buildSocials(context),
                    ],
                  ),
                ),
              ),
              Section(
                title: context.strings.titleSkills,
                child: Padding(
                  padding:
                      const EdgeInsets.all(20) - const EdgeInsets.only(top: 8),
                  child: SkillsOverview(
                    skills: SkillProvider().getSkills(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Section(
                title: context.strings.titleTimeline,
                child: Padding(
                  padding:
                      const EdgeInsets.all(20) - const EdgeInsets.only(top: 8),
                  child: WorkProjectTimeline(
                    projects: WorkProjectProvider().getWorkProjects(),
                    shrinkWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Text(
        '${context.strings.name} ${context.strings.surname}'.toUpperCase(),
        style: context.theme.textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildRole(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: context.strings.companyRoleAt,
              style: context.theme.textTheme.subtitle2,
            ),
            TextSpan(
              text: context.strings.company,
              style: context.theme.textTheme.subtitle2?.copyWith(
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap =
                    () => launchUrl(Uri.parse(context.strings.companyLink)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocials(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 48,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 24,
          children: _buildSocialButtons(context),
        ),
      ),
    );
  }

  List<Widget> _buildSocialButtons(BuildContext context) {
    return [
      SocialButton.image(
        url: context.strings.linkGmail,
        path: Assets.images.icGmail.path,
      ),
      SocialButton.image(
        url: context.strings.linkGithub,
        path: Assets.images.icGithub.path,
      ),
      SocialButton.image(
        url: context.strings.linkGitlab,
        path: Assets.images.icGitlab.path,
      ),
      SocialButton.image(
        url: context.strings.linkLinkedin,
        path: Assets.images.icLinkedin.path,
      ),
      SocialButton.image(
        url: context.strings.linkTelegram,
        path: Assets.images.icTelegram.path,
      ),
    ];
  }
}

class Section extends StatelessWidget {
  static const radius = Radius.circular(8);

  final String title;
  final Widget child;

  const Section({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: radius,
              topRight: radius,
            ),
            color: Theme.of(context).cardColor.darken(),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: radius,
          bottomRight: radius,
        ),
        color: Theme.of(context).cardColor,
      ),
      child: child,
    );
  }
}
