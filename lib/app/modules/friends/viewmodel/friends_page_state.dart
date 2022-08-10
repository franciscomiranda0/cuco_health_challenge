part of 'friends_page_viewmodel.dart';

@immutable
abstract class FriendsPageState {
  const FriendsPageState();
}

class FriendsInitial extends FriendsPageState {
  const FriendsInitial();
}

class FriendsLoadInProgress extends FriendsPageState {
  const FriendsLoadInProgress();
}

class FriendsLoadSuccess extends FriendsPageState {
  const FriendsLoadSuccess();
}

class FriendsLoadError extends FriendsPageState {
  final String message;

  const FriendsLoadError(this.message);
}
