import 'project_working_period.dart';

class WorkProject {
  final String role;
  final String name;
  final bool nda;
  final String description;
  final List<String> labels;
  final ProjectWorkingPeriod period;

  WorkProject({
    required this.role,
    required this.name,
    required this.nda,
    required this.description,
    required this.labels,
    required this.period,
  });

  WorkProject.fromMap(Map<String, dynamic> map)
      : this(
          role: map["role"],
          name: map["name"],
          nda: map["nda"],
          description: map["description"],
          labels: (map["labels"] as List).cast<String>(),
          period: ProjectWorkingPeriod.fromMap(map["period"]),
        );
}
