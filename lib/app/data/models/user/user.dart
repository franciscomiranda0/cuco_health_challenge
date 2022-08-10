import 'package:cuco_health_challenge/app/data/models/person/person.dart';
import 'package:flutter/material.dart';

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
  String get fullNameInitials =>
      '${firstName.characters.first}${lastName.characters.first}'.toUpperCase();
}
