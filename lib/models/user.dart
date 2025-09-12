class User {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;

  User({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
  });

  String get fullName => '$title $firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      title: json['name']['title'] ?? '',
      firstName: json['name']['first'] ?? '',
      lastName: json['name']['last'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['picture']['thumbnail'] ?? '',
    );
  }
}
