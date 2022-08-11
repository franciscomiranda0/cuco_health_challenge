import 'package:cuco_health_challenge/app/commons/assets.dart';
import 'package:cuco_health_challenge/app/commons/widgets/vertical_spacer.dart';
import 'package:flutter/material.dart';

class VisualizationError extends StatelessWidget {
  const VisualizationError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.fallbackError, scale: 12),
          const VerticalSpacer(16),
          const Text('Algo não ocorreu como o esperado.')
        ],
      ),
    );
  }
}
