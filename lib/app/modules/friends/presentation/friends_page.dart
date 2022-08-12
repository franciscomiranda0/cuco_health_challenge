import 'dart:io';

import 'package:cuco_health_challenge/app/commons/modal.dart';
import 'package:cuco_health_challenge/app/commons/widgets/avatar.dart';
import 'package:cuco_health_challenge/app/commons/widgets/horizontal_spacer.dart';
import 'package:cuco_health_challenge/app/commons/widgets/vertical_spacer.dart';
import 'package:cuco_health_challenge/app/data/models/friend/friend.dart';
import 'package:cuco_health_challenge/app/data/repositories/user_repository.dart';
import 'package:cuco_health_challenge/app/modules/friends/viewmodel/friends_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'friends_view.dart';
part 'widgets/friend_listing.dart';
part 'widgets/friend_listing_item.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FriendsPageViewModel>(
      create: (_) =>
          FriendsPageViewModel(context.read<UserRepositoryInterface>()),
      child: BlocListener<FriendsPageViewModel, FriendsPageState>(
        listenWhen: (_, current) => current is FriendsLoadError,
        listener: (context, state) =>
            Modal.show(context, (state as FriendsLoadError).message),
        child: const _FriendsView(),
      ),
    );
  }
}
