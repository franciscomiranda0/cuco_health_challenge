import 'package:cuco_health_challenge/app/data/models/user/user.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:cuco_health_challenge/app/modules/user/viewmodel/user_page_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  late UserRepositoryInterface _userRepository;
  late UserPageViewModel _viewModel;

  setUp(() {
    _userRepository = TestUserRepository();
    _viewModel = UserPageViewModel(_userRepository);
  });

  tearDown(() => _viewModel.close());

  test('''
    Should emit [UserLoadInProgress, UserLoadSuccess]
    when [getUser] is called.''', () {
    when(_userRepository.getUser)
        .thenAnswer((_) async => User.fromPerson(personMock));

    expectLater(
        _viewModel.stream,
        emitsInOrder([
          isA<UserLoadInProgress>(),
          isA<UserLoadSuccess>(),
        ]));

    _viewModel.getUser();
  });

  test('''
    Should emit [UserLoadInProgress, UserLoadError]
    when [getUser] is called.''', () {
    when(_userRepository.getUser).thenThrow(Exception());

    expectLater(
        _viewModel.stream,
        emitsInOrder([
          isA<UserLoadInProgress>(),
          isA<UserLoadError>(),
        ]));

    _viewModel.getUser();
  });
}
