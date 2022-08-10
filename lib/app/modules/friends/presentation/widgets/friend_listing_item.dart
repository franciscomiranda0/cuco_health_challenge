part of '../friends_page.dart';

class _FriendListingItem extends StatelessWidget {
  final Friend friend;

  const _FriendListingItem({
    required this.friend,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Avatar(
            url: friend.avatarUrl,
            fallbackInitials: friend.fullNameInitials,
          ),
          const HorizontalSpacer(8),
          Text(
            friend.fullName,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
