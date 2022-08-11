import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cuco_health_challenge/app/commons/http_client.dart';
import 'package:cuco_health_challenge/app/commons/widgets/snackbar.dart';
import 'package:cuco_health_challenge/app/commons/widgets/snackbar.dart' as own;
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:cuco_health_challenge/app/modules/connectivity/presentation/no_connectivity_view.dart';
import 'package:cuco_health_challenge/app/modules/connectivity/viewmodel/connectivity_viewmodel.dart';
import 'package:cuco_health_challenge/app/modules/user/presentation/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(Platform.isIOS
        ? CupertinoPageRoute(builder: (_) => page)
        : MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepositoryInterface>(
      create: (_) => UserRepository(httpClient: HttpClient()),
      child: BlocProvider<ConnectivityCubit>(
        create: (_) => ConnectivityCubit(Connectivity()),
        child: MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
          home: BlocListener<ConnectivityCubit, ConnectivityState>(
            listenWhen: (previous, current) {
              return (previous is ConnectionFailure &&
                      current is ConnectionSuccess) ||
                  current is ConnectionFailure ||
                  current is ConnectionError;
            },
            listener: (context, state) {
              if (state is ConnectionSuccess) {
                _navigateTo(context, const UserPage());
              } else if (state is ConnectionFailure) {
                _navigateTo(context, const NoConnectivityView());
              } else if (state is ConnectionError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  own.SnackBar.warning(text: state.message),
                );
              }
            },
            child: const UserPage(),
          ),
        ),
      ),
    );
  }
}
