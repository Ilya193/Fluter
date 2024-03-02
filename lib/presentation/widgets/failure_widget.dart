import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text('Произошла ошибка'),
        OutlinedButton(onPressed: () {}, child: const Text('Попробовать снова'))
      ],
    );
  }
}