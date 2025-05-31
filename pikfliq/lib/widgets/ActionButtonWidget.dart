
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback onFetchMovie;

  const ActionButtonWidget({super.key, required this.onFetchMovie});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}