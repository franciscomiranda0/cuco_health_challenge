import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  final String url;
  final String fallbackInitials;
  final double radius;

  const Avatar({
    required this.url,
    required this.fallbackInitials,
    this.radius = 24,
    Key? key,
  }) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _showInitials = false;

  @override
  Widget build(BuildContext context) {
    return _showInitials
        ? CircleAvatar(
            backgroundColor: Colors.amber,
            radius: widget.radius,
            child: Text(
              widget.fallbackInitials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        : CircleAvatar(
            backgroundColor: Colors.amber,
            backgroundImage: NetworkImage(widget.url),
            radius: widget.radius,
            onBackgroundImageError: (_, __) =>
                setState(() => _showInitials = true),
          );
  }
}
