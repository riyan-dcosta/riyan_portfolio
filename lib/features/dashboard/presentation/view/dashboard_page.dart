import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  late AnimationController weightAnimationController;
  late Animation<int> weightAnimation;

  @override
  void initState() {
    super.initState();
    weightAnimationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    weightAnimation =
        IntTween(begin: 0, end: 8).animate(weightAnimationController);
    weightAnimationController.repeat();
    weightAnimation.addListener(() {
      print("weight  : ${weightAnimation.value}");
      setState(() {});
    });
  }

  @override
  void dispose() {
    weightAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(offset: Offset(1, 1)),
            BoxShadow(offset: Offset(0, 2), spreadRadius: 0.0),
          ]),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Center(
          child: Text(
        "Content is being added",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.values[weightAnimation.value],
          fontVariations: [
            // 1-1000, fav: 100 - 1000
            // FontVariation("wght", weightAnimation.value),
            // >(-90), <90. fav: -5 <-> +5
            FontVariation("slnt", -5),
            // regular: 100, fav: 100 - 120
            FontVariation("wdth", 100),
            // 10-16
            FontVariation("opsz", 100),
          ],
        ),
      )),
    );
  }
}
