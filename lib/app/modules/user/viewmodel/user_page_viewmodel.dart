import 'package:cuco_health_challenge/app/commons/exceptions.dart';
import 'package:cuco_health_challenge/app/data/models/user/user.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_page_state.dart';

class UserPageViewModel extends Cubit<UserPageState> {
  final UserRepositoryInterface _userRepository;
  late final User _user;

  UserPageViewModel(this._userRepository) : super(const UserInitial());

  Future<void> getUser() async {
    emit(const UserLoadInProgress());
    try {
      final user = await _userRepository.getUser();
      _user = user;
      emit(const UserLoadSuccess());
    } on RequestException catch (exception) {
      emit(UserLoadError(exception.toString()));
    } catch (_) {
      emit(const UserLoadError('Ops, erro inesperado.'));
    }
  }

  User get user => _user;
}
