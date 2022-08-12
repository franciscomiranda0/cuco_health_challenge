import 'package:cuco_health_challenge/app/data/models/friend/friend.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:cuco_health_challenge/app/modules/friends/viewmodel/friends_page_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  late UserRepositoryInterface _userRepository;
  late FriendsPageViewModel _viewModel;

  setUp(() {
    _userRepository = TestUserRepository();
    _viewModel = FriendsPageViewModel(_userRepository);
  });

  tearDown(() => _viewModel.close());

  test('''
    Should emit [FriendsLoadInProgress, FriendsLoadSuccess]
    when [getFriends] is called.''', () {
    when(_userRepository.getFriends).thenAnswer((_) async => List.of([
          Friend.fromPerson(personMock),
          Friend.fromPerson(personMock),
          Friend.fromPerson(personMock),
        ]));

    expectLater(
        _viewModel.stream,
        emitsInOrder([
          isA<FriendsLoadInProgress>(),
          isA<FriendsLoadSuccess>(),
        ]));

    _viewModel.getFriends();
  });

  test('''
    Should emit [FriendsLoadInProgress, FriendsLoadError]
    when [getFriends] is called.''', () {
    when(_userRepository.getUser).thenThrow(Exception());

    expectLater(
        _viewModel.stream,
        emitsInOrder([
          isA<FriendsLoadInProgress>(),
          isA<FriendsLoadError>(),
        ]));

    _viewModel.getFriends();
  });
}
