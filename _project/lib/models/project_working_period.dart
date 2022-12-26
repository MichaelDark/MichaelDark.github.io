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
