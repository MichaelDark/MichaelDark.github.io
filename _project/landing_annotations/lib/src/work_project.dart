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

class ProjectWorkingPeriod implements Comparable<ProjectWorkingPeriod> {
  final DateTime from;
  final DateTime? to;

  const ProjectWorkingPeriod({
    required this.from,
    required this.to,
  });

  ProjectWorkingPeriod.fromMap(Map<String, dynamic> map)
      : this(
          from: DateTime.parse(map["from"]),
          to: DateTime.tryParse(map["to"] ?? ''),
        );

  @override
  int compareTo(ProjectWorkingPeriod other) => from.compareTo(other.from);
}
