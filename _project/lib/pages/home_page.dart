import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../utils/build_context_ext.dart';
import 'views/social_button.dart';

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
            ),
          ),
          Positioned.fill(
            child: SizedBox.expand(
              child: ColoredBox(
                color: context.theme.colorScheme.background.withOpacity(0.85),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                _buildName(context),
                _buildNickname(context),
                const SizedBox(height: 24),
                _buildSocials(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Text(
        '${context.strings.name} ${context.strings.surname}',
        style: context.theme.textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNickname(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Text(
        context.strings.nickname,
        style: context.theme.textTheme.headline4,
        textAlign: TextAlign.center,
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
