import 'package:flutter/material.dart';
import 'package:riyan_portfolio/features/components/animated_text/animated_text_widget.dart';
import 'package:riyan_portfolio/features/components/spacial_card/spacial_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Flutter Developer with experience in Python for AI and AWS "
            "Services"),
        Wrap(
          children: [
            SpacialCard(child: Text("This is Adaptive UI Card")),
          ],
        ),
        AnimatedTextWidget(title: "Contents are being added...")
      ],
    );
  }
}
