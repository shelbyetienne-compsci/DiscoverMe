class Skill {
  final String name;
  final String? category;
  final int order;

  const Skill({
    required this.name,
    this.category,
    required this.order,
  });

  Skill copyWith({
    String? name,
    String? category,
    int? order,
  }) {
    return Skill(
      name: name ?? this.name,
      category: category ?? this.category,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'order': order,
    };
  }

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'] ?? '',
      category: json['category'],
      order: json['order'] ?? 0,
    );
  }
}