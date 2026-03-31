class Link {
  final String label;
  final String url;
  final int order;

  Link({
    required this.label,
    required this.url,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'url': url,
      'order': order,
    };
  }

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      label: json['label'] ?? '',
      url: json['url'] ?? '',
      order: json['order'] ?? '',
    );
  }
}