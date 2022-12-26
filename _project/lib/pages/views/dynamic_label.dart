import 'package:flutter/material.dart';

import '../../config.dart';
import '../../gen/assets.gen.dart';
import '../../utils/color_ext.dart';

class DynamicLabel extends StatelessWidget {
  static const double leadingSize = 12;

  final String text;
  final Color? color;
  final Widget? leading;

  const DynamicLabel({
    Key? key,
    required this.text,
    this.color,
    this.leading,
  }) : super(key: key);

  Color _getColor(BuildContext context) {
    final color = this.color;
    if (color != null) return color;
    return Colors.grey[200]!; //Theme.of(context).colorScheme.primary;
  }

  Widget? getLeading(BuildContext context, Color foregroundColor) {
    final leading = this.leading;
    if (leading != null) return leading;

    final lowercasedText = text.toLowerCase();

    Map<String, IconData> icons = {
      'android': Icons.android_rounded,
      'qr': Icons.qr_code_rounded,
    };
    for (final entry in icons.entries) {
      if (lowercasedText.contains(entry.key)) {
        return Icon(entry.value, color: foregroundColor, size: leadingSize);
      }
    }

    Map<String, String> assets = {
      'apple': Assets.images.icApple.path,
      'bash': Assets.images.icBash.path,
      'bitbucket': Assets.images.icBitbucket.path,
      'codemagic': Assets.images.icCodemagic.path,
      'dart': Assets.images.icDart.path,
      'firebase': Assets.images.icFirebase.path,
      'flutter': Assets.images.icFlutter.path,
      'github': Assets.images.icGithub.path,
      'gitlab': Assets.images.icGitlab.path,
      'gmail': Assets.images.icGmail.path,
      'google': Assets.images.icGoogle.path,
      'java': Assets.images.icJava.path,
      'jenkins': Assets.images.icJenkins.path,
      'jira': Assets.images.icJira.path,
      'kotlin': Assets.images.icKotlin.path,
      'linkedin': Assets.images.icLinkedin.path,
      'revenuecat': Assets.images.icRevenuecat.path,
      'sentry': Assets.images.icSentry.path,
      'sqlite': Assets.images.icSqlite.path,
      'sqflite': Assets.images.icSqlite.path,
      'storekit': Assets.images.icApple.path,
      'swift': Assets.images.icSwift.path,
      'telegram': Assets.images.icTelegram.path,
      'testflight': Assets.images.icTestflight.path,
      'trello': Assets.images.icTrello.path,
      'typescript': Assets.images.icTypescript.path,
      'visual studio code': Assets.images.icVscode.path,
      'xcode': Assets.images.icXcode.path,
      'git': Assets.images.icGit.path,
    };
    for (final entry in assets.entries) {
      if (lowercasedText.contains(entry.key)) {
        return Image.asset(
          entry.value,
          height: leadingSize,
          width: leadingSize,
          filterQuality: globalFilterQuality,
        );
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final leading = getLeading(context, color.forForeground);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading,
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color.forForeground,
                ),
          ),
        ],
      ),
    );
  }
}
