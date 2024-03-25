import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  final String information;
  
  const InformationWidget({super.key, required this.information});
  
  @override
  Widget build(BuildContext context) {
    return Text(information);
  }
}
