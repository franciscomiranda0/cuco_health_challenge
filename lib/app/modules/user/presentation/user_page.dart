import 'dart:io';

import 'package:cuco_health_challenge/app/commons/widgets/error.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:cuco_health_challenge/app/modules/friends/presentation/friends_page.dart';
import 'package:cuco_health_challenge/app/modules/user/viewmodel/user_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_view.dart';
part 'widgets/user_detail.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserPageViewModel>(
      create: (_) => UserPageViewModel(context.read<UserRepositoryInterface>()),
      child: const _UserView(),
    );
  }
}
