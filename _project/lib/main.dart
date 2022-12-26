import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'utils/preferences.dart';

void main() async {
  Hive.initFlutter();

  await Preferences.initialize();

  runApp(const App());
}
