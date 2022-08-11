part of 'user_page.dart';

class _UserView extends StatelessWidget {
  const _UserView({Key? key}) : super(key: key);

  void _navigateToFriendsPage(BuildContext context) {
    Navigator.of(context).push(
      Platform.isAndroid
          ? MaterialPageRoute(builder: (_) => const FriendsPage())
          : CupertinoPageRoute(builder: (_) => const FriendsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UserPageViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.getUser());

    return SafeArea(
      child: Scaffold(
        floatingActionButton: GestureDetector(
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
        ),
        body: BlocBuilder<UserPageViewModel, UserPageState>(
          builder: (_, state) {
            if (state is UserLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              );
            } else if (state is UserLoadSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 200,
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: -100,
                                child: Container(
                                  color: Colors.black12,
                                  height: 200,
                                  width: constraints.maxWidth,
                                ),
                              ),
                              const Divider(
                                color: Colors.amber,
                                thickness: 2,
                              ),
                              Avatar(
                                url: viewModel.user.avatarUrl,
                                fallbackInitials:
                                    viewModel.user.fullNameInitials,
                                radius: 64,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    const VerticalSpacer(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _UserDetail(
                            icon: Icons.person_outlined,
                            content: viewModel.user.fullName,
                          ),
                          const VerticalSpacer(8),
                          _UserDetail(
                            icon: Icons.email_outlined,
                            content: viewModel.user.email,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is UserLoadError) {
              return const VisualizationError();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
