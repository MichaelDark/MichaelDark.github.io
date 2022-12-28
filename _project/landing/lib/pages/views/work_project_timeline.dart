import 'package:flutter/material.dart';
import 'package:landing_annotations/landing_annotations.dart';
import 'package:timelines/timelines.dart';

import '../../config.dart';
import '../../gen/assets.gen.dart';
import '../../utils/color_ext.dart';
import 'work_project_content.dart';
import 'work_project_opposite_content.dart';

class WorkProjectTimeline extends StatelessWidget {
  final bool shrinkWrap;
  final List<WorkProject> projects;

  const WorkProjectTimeline({
    super.key,
    required this.projects,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: shrinkWrap,
      padding: const EdgeInsets.all(16),
      builder: TimelineTileBuilder(
        contentsAlign: ContentsAlign.basic,
        indicatorBuilder: (context, index) => Indicator.widget(
          child: Container(
            padding: const EdgeInsets.all(6) +
                const EdgeInsets.only(left: 3) +
                const EdgeInsets.only(bottom: 1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getColorByIndex(context, index),
            ),
            child: Image.asset(
              Assets.images.icProarea.path,
              height: 20,
              width: 20,
              alignment: Alignment.center,
              filterQuality: globalFilterQuality,
            ),
          ),
        ),
        startConnectorBuilder: _buildConnector,
        endConnectorBuilder: _buildConnector,
        itemCount: projects.length,
        indicatorPositionBuilder: (context, index) => 0,
        nodePositionBuilder: (context, index) => 0.3,
        oppositeContentsBuilder: (context, index) {
          final project = projects[index];
          return WorkProjectOppositeContent(project: project);
        },
        contentsBuilder: (context, index) {
          final project = projects[index];
          return WorkProjectContent(project: project);
        },
      ),
    );
  }

  Connector _buildConnector(BuildContext context, int index) {
    return Connector.solidLine(
      color: _getColorByIndex(context, index),
      thickness: 4,
      endIndent: 12,
    );
  }

  Color _getColorByIndex(BuildContext context, int index) {
    final cardColor = Theme.of(context).cardColor;
    if (index == 0) return cardColor.darken();
    return cardColor.darken().darken();
  }
}
