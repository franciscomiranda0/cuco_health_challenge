import 'package:cuco_health_challenge/app/commons/http_client.dart';

abstract class UserRepositoryInterface {
  Future getUser();
  Future getUserFriends();
}

class UserRepository implements UserRepositoryInterface {
  final HttpClientInterface _httpClient;

  const UserRepository({required HttpClientInterface httpClient})
      : _httpClient = httpClient;

  @override
  Future getUser() async {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future getUserFriends() async {
    // TODO: implement getUserFriends
    throw UnimplementedError();
  }
}
