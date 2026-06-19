import 'package:flutter/material.dart';

class BuddyCharacter extends StatelessWidget {
  const BuddyCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/robot.png',
      height: 180,
    );
  }
}