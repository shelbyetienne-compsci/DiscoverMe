class Education {
  final String school;
  final String degree;

  final DateTime startDate;
  final DateTime? endDate;

  final String? imageUrl;
  final int order;

  const Education({
    required this.school,
    required this.degree,
    required this.startDate,
    this.endDate,
    this.imageUrl,
    required this.order,
  });

  Education copyWith({
    String? school,
    String? degree,
    DateTime? startDate,
    DateTime? endDate,
    String? imageUrl,
    int? order,
  }) {
    return Education(
      school: school ?? this.school,
      degree: degree ?? this.degree,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'school': school,
      'degree': degree,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'imageUrl': imageUrl,
      'order': order,
    };
  }

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      school: json['school'] ?? '',
      degree: json['degree'] ?? '',
      startDate: DateTime.parse(json['startDate']),
      endDate:
      json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      imageUrl: json['imageUrl'],
      order: json['order'] ?? 0,
    );
  }
}