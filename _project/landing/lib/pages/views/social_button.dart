import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../config.dart';

class SocialButton extends StatelessWidget {
  static const double size = 32;

  final Widget icon;
  final String url;

  const SocialButton({super.key, required this.icon, required this.url});

  SocialButton.image({super.key, required String path, required this.url})
      : icon = Image.asset(
          path,
          height: size,
          width: size,
          filterQuality: globalFilterQuality,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlString(url),
      child: icon,
    );
  }
}
