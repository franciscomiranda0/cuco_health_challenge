import 'package:cuco_health_challenge/app/data/models/person/person.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:mocktail/mocktail.dart';

const personMock = Person(
  firstName: 'Name',
  lastName: 'Surname',
  avatarUrl: 'URL',
  email: 'e@mail.com',
);

class TestUserRepository extends Mock implements UserRepositoryInterface {}
