import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

extension AppLocalizationsBuildContextExt on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this);
  ThemeData get theme => Theme.of(this);
}
