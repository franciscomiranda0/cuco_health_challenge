part of 'friends_page.dart';

class _FriendsView extends StatelessWidget {
  const _FriendsView({Key? key}) : super(key: key);

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    const header = Text(
      'Amigos',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Platform.isIOS) ...[
                  const VerticalSpacer(16),
                  GestureDetector(
                    onTap: () => _navigateBack(context),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ],
                const VerticalSpacer(16),
                header,
                const VerticalSpacer(16),
                const _FriendListing(),
                const VerticalSpacer(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
