import 'package:flutter/material.dart';

class Modal {
  const Modal._();

  static void show(BuildContext context, String text) => showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Erro'),
            content: Text(text),
          );
        },
      );
}
