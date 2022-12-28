import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:landing_annotations/landing_annotations.dart';

import '../../utils/build_context_ext.dart';

DateFormat get projectDateFormat => DateFormat("MMM yyyy");

class WorkProjectOppositeContent extends StatelessWidget {
  final WorkProject project;

  const WorkProjectOppositeContent({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final period = project.period;
    final from = period.from;
    final to = period.to;

    final caption = to == null
        ? "${projectDateFormat.format(from)} - ${context.strings.labelPresent}"
        : "${projectDateFormat.format(from)} - ${projectDateFormat.format(to)}";

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      alignment: Alignment.topRight,
      child: Text(
        caption,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
