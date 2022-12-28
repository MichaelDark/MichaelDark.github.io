/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $DataGen {
  const $DataGen();

  /// File path: data/skill_set.json
  String get skillSet => 'data/skill_set.json';

  /// File path: data/work_projects.json
  String get workProjects => 'data/work_projects.json';

  /// List of all assets
  List<String> get values => [skillSet, workProjects];
}

class $ImagesGen {
  const $ImagesGen();

  /// File path: images/bg_seamless.dark.jpg
  AssetGenImage get bgSeamlessDark =>
      const AssetGenImage('images/bg_seamless.dark.jpg');

  /// File path: images/bg_seamless.jpg
  AssetGenImage get bgSeamless => const AssetGenImage('images/bg_seamless.jpg');

  /// File path: images/bg_seamless_big.jpg
  AssetGenImage get bgSeamlessBig =>
      const AssetGenImage('images/bg_seamless_big.jpg');

  /// File path: images/favicon.png
  AssetGenImage get favicon => const AssetGenImage('images/favicon.png');

  /// File path: images/ic_apple.png
  AssetGenImage get icApple => const AssetGenImage('images/ic_apple.png');

  /// File path: images/ic_bash.png
  AssetGenImage get icBash => const AssetGenImage('images/ic_bash.png');

  /// File path: images/ic_bitbucket.png
  AssetGenImage get icBitbucket =>
      const AssetGenImage('images/ic_bitbucket.png');

  /// File path: images/ic_codemagic.jpg
  AssetGenImage get icCodemagic =>
      const AssetGenImage('images/ic_codemagic.jpg');

  /// File path: images/ic_dart.png
  AssetGenImage get icDart => const AssetGenImage('images/ic_dart.png');

  /// File path: images/ic_firebase.png
  AssetGenImage get icFirebase => const AssetGenImage('images/ic_firebase.png');

  /// File path: images/ic_flutter.png
  AssetGenImage get icFlutter => const AssetGenImage('images/ic_flutter.png');

  /// File path: images/ic_git.png
  AssetGenImage get icGit => const AssetGenImage('images/ic_git.png');

  /// File path: images/ic_github.png
  AssetGenImage get icGithub => const AssetGenImage('images/ic_github.png');

  /// File path: images/ic_gitlab.png
  AssetGenImage get icGitlab => const AssetGenImage('images/ic_gitlab.png');

  /// File path: images/ic_gmail.png
  AssetGenImage get icGmail => const AssetGenImage('images/ic_gmail.png');

  /// File path: images/ic_google.png
  AssetGenImage get icGoogle => const AssetGenImage('images/ic_google.png');

  /// File path: images/ic_java.png
  AssetGenImage get icJava => const AssetGenImage('images/ic_java.png');

  /// File path: images/ic_jenkins.png
  AssetGenImage get icJenkins => const AssetGenImage('images/ic_jenkins.png');

  /// File path: images/ic_jira.png
  AssetGenImage get icJira => const AssetGenImage('images/ic_jira.png');

  /// File path: images/ic_kotlin.png
  AssetGenImage get icKotlin => const AssetGenImage('images/ic_kotlin.png');

  /// File path: images/ic_linkedin.png
  AssetGenImage get icLinkedin => const AssetGenImage('images/ic_linkedin.png');

  /// File path: images/ic_proarea.png
  AssetGenImage get icProarea => const AssetGenImage('images/ic_proarea.png');

  /// File path: images/ic_revenuecat.jpg
  AssetGenImage get icRevenuecat =>
      const AssetGenImage('images/ic_revenuecat.jpg');

  /// File path: images/ic_sentry.png
  AssetGenImage get icSentry => const AssetGenImage('images/ic_sentry.png');

  /// File path: images/ic_sqlite.png
  AssetGenImage get icSqlite => const AssetGenImage('images/ic_sqlite.png');

  /// File path: images/ic_swift.png
  AssetGenImage get icSwift => const AssetGenImage('images/ic_swift.png');

  /// File path: images/ic_telegram.png
  AssetGenImage get icTelegram => const AssetGenImage('images/ic_telegram.png');

  /// File path: images/ic_testFlight.png
  AssetGenImage get icTestFlight =>
      const AssetGenImage('images/ic_testFlight.png');

  /// File path: images/ic_trello.png
  AssetGenImage get icTrello => const AssetGenImage('images/ic_trello.png');

  /// File path: images/ic_typescript.png
  AssetGenImage get icTypescript =>
      const AssetGenImage('images/ic_typescript.png');

  /// File path: images/ic_vscode.png
  AssetGenImage get icVscode => const AssetGenImage('images/ic_vscode.png');

  /// File path: images/ic_xcode.png
  AssetGenImage get icXcode => const AssetGenImage('images/ic_xcode.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bgSeamlessDark,
        bgSeamless,
        bgSeamlessBig,
        favicon,
        icApple,
        icBash,
        icBitbucket,
        icCodemagic,
        icDart,
        icFirebase,
        icFlutter,
        icGit,
        icGithub,
        icGitlab,
        icGmail,
        icGoogle,
        icJava,
        icJenkins,
        icJira,
        icKotlin,
        icLinkedin,
        icProarea,
        icRevenuecat,
        icSentry,
        icSqlite,
        icSwift,
        icTelegram,
        icTestFlight,
        icTrello,
        icTypescript,
        icVscode,
        icXcode
      ];
}

class Assets {
  Assets._();

  static const $DataGen data = $DataGen();
  static const $ImagesGen images = $ImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
