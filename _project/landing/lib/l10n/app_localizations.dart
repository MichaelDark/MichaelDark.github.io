////////////////////////////////////////////////////////////////////////
// DO NOT EXCLUDE GENERATED FILES FROM GIT (i.e. VERSION CONTROL)
////////////////////////////////////////////////////////////////////////
//
// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Mykhailo'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Temnokhud'**
  String get surname;

  /// No description provided for @companyRoleAt.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer at '**
  String get companyRoleAt;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'ProArea'**
  String get company;

  /// No description provided for @companyLink.
  ///
  /// In en, this message translates to:
  /// **'https://proarea.com'**
  String get companyLink;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @linkGithub.
  ///
  /// In en, this message translates to:
  /// **'https://github.com/MichaelDark'**
  String get linkGithub;

  /// No description provided for @linkGitlab.
  ///
  /// In en, this message translates to:
  /// **'https://gitlab.com/MichaelDark'**
  String get linkGitlab;

  /// No description provided for @linkGmail.
  ///
  /// In en, this message translates to:
  /// **'mailto:mtemnohud+githubpages@gmail.com'**
  String get linkGmail;

  /// No description provided for @linkLinkedin.
  ///
  /// In en, this message translates to:
  /// **'https://www.linkedin.com/in/michaeldark/'**
  String get linkLinkedin;

  /// No description provided for @linkTelegram.
  ///
  /// In en, this message translates to:
  /// **'https://t.me/MichaelDark'**
  String get linkTelegram;

  /// No description provided for @labelPresent.
  ///
  /// In en, this message translates to:
  /// **'present'**
  String get labelPresent;

  /// No description provided for @labelNda.
  ///
  /// In en, this message translates to:
  /// **'NDA'**
  String get labelNda;

  /// No description provided for @titleSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get titleSkills;

  /// No description provided for @titleTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get titleTimeline;

  /// No description provided for @skillCategoryLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get skillCategoryLanguages;

  /// No description provided for @skillCategoryProgramming.
  ///
  /// In en, this message translates to:
  /// **'Programming languages'**
  String get skillCategoryProgramming;

  /// No description provided for @skillCategoryTech.
  ///
  /// In en, this message translates to:
  /// **'Technologies & Patterns'**
  String get skillCategoryTech;

  /// No description provided for @skillCategoryDevTools.
  ///
  /// In en, this message translates to:
  /// **'Development tools'**
  String get skillCategoryDevTools;

  /// No description provided for @skillCategoryApis.
  ///
  /// In en, this message translates to:
  /// **'APIs and 3rd party services'**
  String get skillCategoryApis;

  /// No description provided for @skillCategoryVcs.
  ///
  /// In en, this message translates to:
  /// **'VCS'**
  String get skillCategoryVcs;

  /// No description provided for @skillCategoryCicd.
  ///
  /// In en, this message translates to:
  /// **'CI/CD'**
  String get skillCategoryCicd;

  /// No description provided for @skillCategoryIap.
  ///
  /// In en, this message translates to:
  /// **'IAP'**
  String get skillCategoryIap;

  /// No description provided for @skillCategoryDbms.
  ///
  /// In en, this message translates to:
  /// **'DBMS'**
  String get skillCategoryDbms;

  /// No description provided for @skillCategoryTeamManagement.
  ///
  /// In en, this message translates to:
  /// **'Team Management'**
  String get skillCategoryTeamManagement;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
