class Experience {
  final String id;

  final String company;
  final String role;
  final String description;

  final DateTime startDate;
  final DateTime? endDate;

  final String? imageUrl;
  final int order;

  const Experience({
    required this.id,
    required this.company,
    required this.role,
    required this.description,
    required this.startDate,
    this.endDate,
    this.imageUrl,
    required this.order,
  });

  Experience copyWith({
    String? id,
    String? company,
    String? role,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? imageUrl,
    int? order,
  }) {
    return Experience(
      id: id ?? this.id,
      company: company ?? this.company,
      role: role ?? this.role,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'role': role,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'imageUrl': imageUrl,
      'order': order,
    };
  }

  factory Experience.fromJson(Map<String, dynamic> json, String id) {
    return Experience(
      id: id,
      company: json['company'] ?? '',
      role: json['role'] ?? '',
      description: json['description'] ?? '',
      startDate: DateTime.parse(json['startDate']),
      endDate:
      json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      imageUrl: json['imageUrl'],
      order: json['order'] ?? 0,
    );
  }
}