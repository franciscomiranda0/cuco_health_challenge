import 'package:flutter/material.dart' as material;

final scaffoldMessengerKey =
    material.GlobalKey<material.ScaffoldMessengerState>();

class SnackBar extends material.SnackBar {
  SnackBar.warning({
    required String text,
    super.key,
  }) : super(
          backgroundColor: material.Colors.red.shade700,
          behavior: material.SnackBarBehavior.floating,
          content: material.Text(
            text,
            style: material.TextStyle(
              color: material.Colors.red.shade100,
              fontWeight: material.FontWeight.w500,
            ),
          ),
        );
}
