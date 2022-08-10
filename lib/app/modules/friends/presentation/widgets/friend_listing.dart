part of '../friends_page.dart';

class _FriendListing extends StatelessWidget {
  const _FriendListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<FriendsPageViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.getFriends());

    return BlocBuilder<FriendsPageViewModel, FriendsPageState>(
      builder: (_, state) {
        if (state is FriendsLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          );
        } else if (state is FriendsLoadSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: viewModel.friends.length,
            itemBuilder: (_, index) {
              return _FriendListingItem(
                friend: viewModel.friends[index],
              );
            },
          );
        } else if (state is FriendsLoadError) {
          return const VisualizationError();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
