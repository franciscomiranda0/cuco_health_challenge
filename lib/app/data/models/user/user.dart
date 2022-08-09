import 'package:cuco_health_challenge/app/data/models/person/person.dart';

class User {
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String email;

  User.fromPerson(Person person)
      : firstName = person.firstName,
        lastName = person.lastName,
        avatarUrl = person.avatarUrl,
        email = person.email;

  String get fullName => '$firstName $lastName';
}
