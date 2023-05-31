class Project {
  final int? id;
  final String title;
  final String description;
  final String resources;
  final String languages;
  final String time;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.resources,
    required this.languages,
    required this.time,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      resources: json['resources'],
      languages: json['languages'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'resources': resources,
      'languages': languages,
      'time': time,
    };
  }
}
