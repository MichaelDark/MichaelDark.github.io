import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Preferences extends ChangeNotifier {
  static late final Preferences instance;

  static Future<void> initialize() async {
    Box? box;
    try {
      box = await Hive.openBox('preferences');
    } catch (_) {}
    Preferences.instance = Preferences(box);
  }

  final Box? box;

  Preferences(this.box);

  Brightness? getBrightness() {
    try {
      final value = box?.get('brightness');
      if (value == null) return null;
      return value == 'dark' ? Brightness.dark : Brightness.light;
    } catch (_) {
      return null;
    }
  }

  void setBrightness(Brightness? brightness) {
    try {
      box?.put('brightness', brightness == Brightness.dark ? 'dark' : 'light');
      notifyListeners();
    } catch (_) {}
  }
}
