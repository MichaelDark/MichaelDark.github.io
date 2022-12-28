import 'package:flutter/painting.dart';

// https://stackoverflow.com/a/49092130
extension ForegoundCalculatorColorExt on Color {
  double get luminance => 0.2126 * red + 0.7152 * green + 0.0722 * blue;

  Color get forForeground {
    return (luminance < 140)
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF000000);
  }
}

extension IntensityColorExt on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final dark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return dark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final light = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return light.toColor();
  }
}
