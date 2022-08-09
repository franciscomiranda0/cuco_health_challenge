import 'package:cuco_health_challenge/app/data/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_page_viewmodel_state.dart';

class UserPageViewModel extends Cubit<UserPageViewModelState> {
  UserPageViewModel() : super(const UserInitial());
}
