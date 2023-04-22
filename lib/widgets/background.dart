import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.deepPurple],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        )
      ),
      child: child,
    );
  }
}