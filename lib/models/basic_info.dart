class BasicInfo {
  final String uid;
  final String firstName;
  final String lastName;
  final String headline;
  final String bio;
  final String email;

  final String? phone;
  final String? city;
  final String? country;
  final String? profileImageUrl;

  BasicInfo({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.headline,
    required this.bio,
    required this.email,
    this.phone,
    this.city,
    this.country,
    this.profileImageUrl,
  });

  BasicInfo copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? headline,
    String? bio,
    String? email,
    String? phone,
    String? city,
    String? country,
    String? profileImageUrl,
  }) {
    return BasicInfo(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      headline: headline ?? this.headline,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      country: country ?? this.country,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'headline': headline,
      'bio': bio,
      'email': email,
      'phone': phone,
      'city': city,
      'country': country,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory BasicInfo.fromJson(Map<String, dynamic> json) {
    return BasicInfo(
      uid: json['uid'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      headline: json['headline'] ?? '',
      bio: json['bio'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      city: json['city'],
      country: json['country'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
