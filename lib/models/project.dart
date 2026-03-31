class Project {
  final String title;
  final String description;
  final List<String> skills;
  final String? imageUrl;
  final String? liveUrl;

  final DateTime? startDate;
  final DateTime? endDate;

  final int order;

  const Project({
    required this.title,
    required this.description,
    required this.skills,
    this.imageUrl,
    this.liveUrl,
    this.startDate,
    this.endDate,
    required this.order,
  });

  Project copyWith({
    String? title,
    String? description,
    List<String>? skills,
    String? imageUrl,
    String? liveUrl,
    DateTime? startDate,
    DateTime? endDate,
    int? order,
  }) {
    return Project(
      title: title ?? this.title,
      description: description ?? this.description,
      skills: skills ?? this.skills,
      imageUrl: imageUrl ?? this.imageUrl,
      liveUrl: liveUrl ?? this.liveUrl,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'skills': skills,
      'imageUrl': imageUrl,
      'liveUrl': liveUrl,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'order': order,
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
      imageUrl: json['imageUrl'],
      liveUrl: json['liveUrl'],
      startDate:
      json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate:
      json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      order: json['order'] ?? 0,
    );
  }
}