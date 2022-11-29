/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

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

  /// File path: images/ic_github.png
  AssetGenImage get icGithub => const AssetGenImage('images/ic_github.png');

  /// File path: images/ic_gitlab.png
  AssetGenImage get icGitlab => const AssetGenImage('images/ic_gitlab.png');

  /// File path: images/ic_gmail.png
  AssetGenImage get icGmail => const AssetGenImage('images/ic_gmail.png');

  /// File path: images/ic_linkedin.png
  AssetGenImage get icLinkedin => const AssetGenImage('images/ic_linkedin.png');

  /// File path: images/ic_telegram.png
  AssetGenImage get icTelegram => const AssetGenImage('images/ic_telegram.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bgSeamlessDark,
        bgSeamless,
        bgSeamlessBig,
        icGithub,
        icGitlab,
        icGmail,
        icLinkedin,
        icTelegram
      ];
}

class Assets {
  Assets._();

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
