import 'package:cuco_health_challenge/app/commons/exceptions.dart';
import 'package:cuco_health_challenge/app/data/models/friend/friend.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'friends_page_state.dart';

class FriendsPageViewModel extends Cubit<FriendsPageState> {
  final UserRepositoryInterface _userRepository;

  final List<Friend> _friends;

  FriendsPageViewModel(this._userRepository)
      : _friends = [],
        super(const FriendsInitial());

  Future<void> getFriends() async {
    emit(const FriendsLoadInProgress());
    if (_friends.isNotEmpty) _wipeFriends();
    try {
      final friends = await _userRepository.getFriends();
      _friends.addAll(friends);
      emit(const FriendsLoadSuccess());
    } on RequestException catch (exception) {
      emit(FriendsLoadError(exception.toString()));
    } catch (_) {
      emit(const FriendsLoadError('Ops, algo deu errado. Tente novamente.'));
    }
  }

  void _wipeFriends() => _friends.removeRange(0, _friends.length - 1);

  List<Friend> get friends => List.unmodifiable(_friends);
}
