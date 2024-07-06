import 'package:flutter/material.dart';

class SpacialCard extends StatelessWidget {
  const SpacialCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        // border: Border.all(color: Colors.purple.shade100, style: BorderStyle),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 12.0,
            spreadRadius: 6.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.all(18.0),
      child: child,
    );
  }
}
