class Skill {
  final String id;

  final String name;
  final String? category;
  final int order;

  const Skill({
    required this.id,
    required this.name,
    this.category,
    required this.order,
  });

  Skill copyWith({
    String? id,
    String? name,
    String? category,
    int? order,
  }) {
    return Skill(
      id: id ?? this.id,
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

  factory Skill.fromJson(Map<String, dynamic> json, String id) {
    return Skill(
      id: id,
      name: json['name'] ?? '',
      category: json['category'],
      order: json['order'] ?? 0,
    );
  }
}