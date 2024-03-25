
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback onFetchMovie;

  const ActionButtonWidget({Key? key, required this.onFetchMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}