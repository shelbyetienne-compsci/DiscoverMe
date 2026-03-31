class Link {
  final String id;

  final String label;
  final String url;
  final int order;

  const Link({
    required this.id,
    required this.label,
    required this.url,
    required this.order,
  });

  Link copyWith({
    String? id,
    String? label,
    String? url,
    int? order,
  }) {
    return Link(
      id: id ?? this.id,
      label: label ?? this.label,
      url: url ?? this.url,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'url': url,
      'order': order,
    };
  }

  factory Link.fromJson(Map<String, dynamic> json, String id) {
    return Link(
      id: id,
      label: json['label'] ?? '',
      url: json['url'] ?? '',
      order: json['order'] ?? 0,
    );
  }
}