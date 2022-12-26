import 'package:collection/collection.dart';

enum SkillCategory {
  languages,
  programming,
  tech,
  devTools,
  apis,
  vcs,
  cicd,
  iap,
  dbms,
  teamManagement;

  String get jsonCode => name;
}

class SkillSet {
  final SkillCategory category;
  final List<String> value;

  SkillSet({
    required this.category,
    required this.value,
  });

  static SkillSet? fromMap(Map<String, dynamic> map) {
    final code = map["code"];
    final category = SkillCategory.values.firstWhereOrNull(
      (category) => category.jsonCode == code,
    );
    if (category == null) return null;

    return SkillSet(
      category: category,
      value: (map["value"] as List).cast<String>(),
    );
  }
}
