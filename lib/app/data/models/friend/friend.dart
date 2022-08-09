import 'package:cuco_health_challenge/app/data/models/person/person.dart';

class Friend {
  final String firstName;
  final String lastName;
  final String avatarUrl;

  Friend.fromPerson(Person person)
      : firstName = person.firstName,
        lastName = person.lastName,
        avatarUrl = person.avatarUrl;

  String get fullName => '$firstName $lastName';
}
