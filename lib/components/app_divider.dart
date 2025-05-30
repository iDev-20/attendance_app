import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(thickness: 1),
        SizedBox(height: 5),
      ],
    );
  }
}
