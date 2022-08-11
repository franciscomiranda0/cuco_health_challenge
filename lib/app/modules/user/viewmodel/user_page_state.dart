part of 'user_page_viewmodel.dart';

@immutable
abstract class UserPageState {
  const UserPageState();
}

class UserInitial extends UserPageState {
  const UserInitial();
}

class UserLoadInProgress extends UserPageState {
  const UserLoadInProgress();
}

class UserLoadSuccess extends UserPageState {
  const UserLoadSuccess();
}

class UserLoadError extends UserPageState {
  final String message;

  const UserLoadError(this.message);
}
