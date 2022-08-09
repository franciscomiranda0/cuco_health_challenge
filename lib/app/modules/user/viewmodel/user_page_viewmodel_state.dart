part of 'user_page_viewmodel.dart';

@immutable
abstract class UserPageViewModelState {
  const UserPageViewModelState();
}

class UserInitial extends UserPageViewModelState {
  const UserInitial();
}

class UserLoadInProgress extends UserPageViewModelState {
  const UserLoadInProgress();
}

class UserLoadSuccess extends UserPageViewModelState {
  final User user;

  const UserLoadSuccess(this.user);
}

class UserLoadError extends UserPageViewModelState {
  final String message;

  const UserLoadError(this.message);
}
