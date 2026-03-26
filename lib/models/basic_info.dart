import 'link.dart';

class BasicInfo {
  final String fullName;
  final String headline;
  final String bio;
  final String email;

  final String? phone;
  final String? city;
  final String? country;
  final String? profileImageUrl;

  final List<Link> links;

  BasicInfo({
    required this.fullName,
    required this.headline,
    required this.bio,
    required this.email,
    this.phone,
    this.city,
    this.country,
    this.profileImageUrl,
    required this.links,
  });

  BasicInfo copyWith({
    String? fullName,
    String? headline,
    String? bio,
    String? email,
    String? phone,
    String? city,
    String? country,
    String? profileImageUrl,
    List<Link>? links,
  }) {
    return BasicInfo(
      fullName: fullName ?? this.fullName,
      headline: headline ?? this.headline,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      country: country ?? this.country,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'headline': headline,
      'bio': bio,
      'email': email,
      'phone': phone,
      'city': city,
      'country': country,
      'profileImageUrl': profileImageUrl,
      'links': links.map((e) => e.toJson()).toList(),
    };
  }

  factory BasicInfo.fromJson(Map<String, dynamic> json) {
    return BasicInfo(
      fullName: json['fullName'] ?? '',
      headline: json['headline'] ?? '',
      bio: json['bio'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      city: json['city'],
      country: json['country'],
      profileImageUrl: json['profileImageUrl'],
      links: (json['links'] as List<dynamic>? ?? [])
          .map((e) => Link.fromJson(e))
          .toList(),
    );
  }
}
