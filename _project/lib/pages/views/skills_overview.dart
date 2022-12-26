import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../models/skill.dart';
import '../../utils/build_context_ext.dart';
import 'dynamic_label.dart';

class SkillsOverview extends StatelessWidget {
  final List<SkillSet> skills;

  const SkillsOverview({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final category in SkillCategory.values)
          ..._buildSkillSet(
            category.getLabel(context),
            category,
          ),
      ],
    );
  }

  List<Widget> _buildSkillSet(String title, SkillCategory category) {
    final skillSet = skills.firstWhereOrNull((set) => set.category == category);
    if (skillSet == null) return [];
    return _buildLabels(title, skillSet.value);
  }

  List<Widget> _buildLabels(String title, Iterable<String> labels) {
    return [
      Padding(
        padding: const EdgeInsets.all(4),
        child: Text(title),
      ),
      Padding(
        padding: const EdgeInsets.all(4),
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            ...labels.map((label) => DynamicLabel(text: label)),
          ],
        ),
      ),
    ];
  }
}

extension on SkillCategory {
  String getLabel(BuildContext context) {
    switch (this) {
      case SkillCategory.languages:
        return context.strings.skillCategoryLanguages;
      case SkillCategory.programming:
        return context.strings.skillCategoryProgramming;
      case SkillCategory.tech:
        return context.strings.skillCategoryTech;
      case SkillCategory.devTools:
        return context.strings.skillCategoryDevTools;
      case SkillCategory.apis:
        return context.strings.skillCategoryApis;
      case SkillCategory.vcs:
        return context.strings.skillCategoryVcs;
      case SkillCategory.cicd:
        return context.strings.skillCategoryCicd;
      case SkillCategory.iap:
        return context.strings.skillCategoryIap;
      case SkillCategory.dbms:
        return context.strings.skillCategoryDbms;
      case SkillCategory.teamManagement:
        return context.strings.skillCategoryTeamManagement;
    }
  }
}
