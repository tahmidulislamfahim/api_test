class User {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;
  final String gender;
  final String phone;
  final String city;
  final String country;
  final String dateOfBirth;
  final String age;
  final String registrationDate;
  final String registrationAge;
  final String nat;

  User({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
    required this.gender,
    required this.phone,
    required this.city,
    required this.country,
    required this.dateOfBirth,
    required this.age,
    required this.registrationDate,
    required this.registrationAge,
    required this.nat,
  });

  String get fullName => '$title $firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      title: json['name']['title'] ?? '',
      firstName: json['name']['first'] ?? '',
      lastName: json['name']['last'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['picture']['thumbnail'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      city: json['location']['city'] ?? '',
      country: json['location']['country'] ?? '',
      dateOfBirth: json['dob']['date'] ?? '',
      age: json['dob']['age']?.toString() ?? '',
      registrationDate: json['registered']['date'] ?? '',
      registrationAge: json['registered']['age']?.toString() ?? '',
      nat: json['nat'] ?? '',
    );
  }
}
