import 'package:cuco_health_challenge/app/data/models/person/person.dart';

class Friend {
  final String firstName;
  final String lastName;
  final String avatarUrl;

  const Friend._({
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
  });

  factory Friend.fromPerson(Person person) => Friend._(
        firstName: person.firstName,
        lastName: person.lastName,
        avatarUrl: person.avatarUrl,
      );

  String get fullName => '$firstName $lastName';
}
