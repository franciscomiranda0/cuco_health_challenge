import 'package:flutter/material.dart';

class NoConnectivityView extends StatelessWidget {
  const NoConnectivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Não há conexão de internet.\nPor favor, cheque.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
