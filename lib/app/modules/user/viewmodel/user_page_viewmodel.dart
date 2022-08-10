import 'package:cuco_health_challenge/app/commons/exceptions.dart';
import 'package:cuco_health_challenge/app/data/models/user/user.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_page_state.dart';

class UserPageViewModel extends Cubit<UserPageState> {
  final UserRepositoryInterface _userRepository;

  UserPageViewModel(this._userRepository) : super(const UserInitial());

  Future<void> getUser() async {
    emit(const UserLoadInProgress());
    try {
      emit(UserLoadSuccess(await _userRepository.getUser()));
    } on RequestException catch (exception) {
      emit(UserLoadError(exception.toString()));
    } catch (_) {
      emit(const UserLoadError('Ops, algo deu errado. Tente novamente.'));
    }
  }
}
