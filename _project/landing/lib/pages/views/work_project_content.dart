import 'package:flutter/material.dart';
import 'package:landing_annotations/landing_annotations.dart';

import '../../utils/build_context_ext.dart';
import 'dynamic_label.dart';

class WorkProjectContent extends StatelessWidget {
  final WorkProject project;

  const WorkProjectContent({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProjectName(context),
          if (project.labels.isNotEmpty) _buildWorkLabelsLabel(context),
          _buildProjectDescription(context),
        ],
      ),
    );
  }

  Widget _buildProjectName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: project.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (project.nda)
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: DynamicLabel(
                    text: context.strings.labelNda,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkLabelsLabel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          ...project.labels.map((label) {
            return DynamicLabel(
              text: label,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildProjectDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        project.description,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
