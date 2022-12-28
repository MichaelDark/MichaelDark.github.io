import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'utils/preferences.dart';

void main() async {
  setPathUrlStrategy();

  Hive.initFlutter();

  await Preferences.initialize();

  runApp(const App());
}
