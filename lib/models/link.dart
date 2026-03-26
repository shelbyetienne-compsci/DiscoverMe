class Link {
  final String label;
  final String url;

  Link({
    required this.label,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'url': url,
    };
  }

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      label: json['label'] ?? '',
      url: json['url'] ?? '',
    );
  }
}