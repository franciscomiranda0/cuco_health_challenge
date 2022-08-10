import 'package:cuco_health_challenge/app/commons/http_client.dart';
import 'package:cuco_health_challenge/app/data/models/friend/friend.dart';
import 'package:cuco_health_challenge/app/data/models/person/person_response.dart';
import 'package:cuco_health_challenge/app/data/models/user/user.dart';

abstract class UserRepositoryInterface {
  Future<User> getUser();
  Future<List<Friend>> getFriends();
}

class UserRepository implements UserRepositoryInterface {
  static const _userEndpoint = 'api/';
  final HttpClientInterface _httpClient;

  const UserRepository({required HttpClientInterface httpClient})
      : _httpClient = httpClient;

  @override
  Future<User> getUser() async {
    final personResponse = PeopleResponse.fromMap(
      await _httpClient.get(_userEndpoint),
    );

    return User.fromPerson(personResponse.people.first);
  }

  @override
  Future<List<Friend>> getFriends() async {
    final personResponse = PeopleResponse.fromMap(await _httpClient.get(
      _userEndpoint,
      queryParameters: {'results': '15'},
    ));

    return personResponse.people
        .map((person) => Friend.fromPerson(person))
        .toList();
  }
}
