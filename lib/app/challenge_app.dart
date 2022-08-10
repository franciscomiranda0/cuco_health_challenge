import 'package:cuco_health_challenge/app/commons/http_client.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:cuco_health_challenge/app/modules/user/presentation/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepositoryInterface>(
      create: (_) => UserRepository(httpClient: HttpClient()),
      child: const MaterialApp(
        home: UserPage(),
      ),
    );
  }
}
