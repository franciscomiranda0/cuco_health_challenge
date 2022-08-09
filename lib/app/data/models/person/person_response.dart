import 'package:cuco_health_challenge/app/data/models/person/person.dart';

class PeopleResponse {
  final List<Person> _people;

  const PeopleResponse._(this._people);

  factory PeopleResponse.fromMap(Map<String, dynamic> map) {
    final people = (map['results'] as List)
        .map((result) => Person(
              firstName: result['name']['first'],
              lastName: result['name']['last'],
              avatarUrl: result['picture']['thumbnail'],
              email: result['email'],
            ))
        .toList();

    return PeopleResponse._(people);
  }

  List<Person> get people => List.unmodifiable(_people);
}
