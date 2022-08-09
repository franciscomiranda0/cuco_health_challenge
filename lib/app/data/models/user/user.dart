import 'package:cuco_health_challenge/app/data/models/person/person.dart';

class User {
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String email;

  const User._({
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    required this.email,
  });

  factory User.fromPerson(Person person) => User._(
        firstName: person.firstName,
        lastName: person.lastName,
        avatarUrl: person.avatarUrl,
        email: person.email,
      );

  String get fullName => '$firstName $lastName';
}
