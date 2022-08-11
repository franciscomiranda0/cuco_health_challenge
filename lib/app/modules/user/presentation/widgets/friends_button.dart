part of '../user_page.dart';

class _FriendsButton extends StatelessWidget {
  const _FriendsButton({Key? key}) : super(key: key);

  void _navigateToFriendsPage(BuildContext context) {
    Navigator.of(context).push(
      Platform.isAndroid
          ? MaterialPageRoute(builder: (_) => const FriendsPage())
          : CupertinoPageRoute(builder: (_) => const FriendsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPageViewModel, UserPageState>(builder: (_, state) {
      if (state is UserLoadError) {
        return const SizedBox.shrink();
      }
      return GestureDetector(
        onTap: () => _navigateToFriendsPage(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.amber,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black26,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.people_outline,
                size: 32,
              ),
              HorizontalSpacer(8),
              Text(
                'Amigos',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
