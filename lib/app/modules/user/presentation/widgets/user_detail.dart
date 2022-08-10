part of '../user_page.dart';

class _UserDetail extends StatelessWidget {
  final IconData icon;
  final String content;

  const _UserDetail({
    Key? key,
    required this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 32),
        const SizedBox(width: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
