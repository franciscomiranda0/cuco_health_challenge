import 'dart:io';

import 'package:cuco_health_challenge/app/commons/widgets/avatar.dart';
import 'package:cuco_health_challenge/app/commons/widgets/error.dart';
import 'package:cuco_health_challenge/app/commons/widgets/horizontal_spacer.dart';
import 'package:cuco_health_challenge/app/commons/widgets/snackbar.dart' as own;
import 'package:cuco_health_challenge/app/commons/widgets/vertical_spacer.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:cuco_health_challenge/app/modules/friends/presentation/friends_page.dart';
import 'package:cuco_health_challenge/app/modules/user/viewmodel/user_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_view.dart';
part 'widgets/friends_button.dart';
part 'widgets/user_detail.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserPageViewModel>(
      create: (_) => UserPageViewModel(context.read<UserRepositoryInterface>()),
      child: BlocListener<UserPageViewModel, UserPageState>(
        listenWhen: (_, current) => current is UserLoadError,
        listener: (_, state) => ScaffoldMessenger.of(context).showSnackBar(
          own.SnackBar.warning(
            text: (state as UserLoadError).message,
          ),
        ),
        child: const _UserView(),
      ),
    );
  }
}
