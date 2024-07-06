import 'package:flutter/material.dart';
import 'package:riyan_portfolio/features/components/spacial_card/spacial_card.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key, required this.title});

  final String title;

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  /// Staggred Animation
  late AnimationController multiVariationController;
  late Animation<double> weightAnimation;
  late Animation<double> slantAnimation;
  late Animation<double> opszAnimation;

  @override
  void initState() {
    super.initState();

    /// Animations
    multiVariationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(
            reverse: true,
          );
    weightAnimation = Tween<double>(begin: 100, end: 900).animate(
      CurvedAnimation(
        parent: multiVariationController,
        curve: const Interval(0, 1, curve: Curves.linear),
      ),
      // weightAnimationController,
    );
    slantAnimation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: multiVariationController,
        curve: const Interval(0.4, 0.8, curve: Curves.linear),
      ),
    );
    opszAnimation = Tween<double>(begin: 10, end: 16).animate(
      CurvedAnimation(
        parent: multiVariationController,
        curve: const Interval(0, 1, curve: Curves.linear),
        // reverseCurve: const Interval(0.5,1, curve: Curves.linear),
      ),
    );
  }

  @override
  void dispose() {
    multiVariationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SpacialCard(
      child: AnimatedBuilder(
        animation: weightAnimation,
        builder: (BuildContext context, Widget? child) {
          return Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'ds_var',
              fontVariations: [
                FontVariation("wght", weightAnimation.value),
                // >(-90), <90. favourable: -5 <-> +5
                // FontVariation("slnt", slantAnimation.value),
                // regular: 100, fav: 100 - 120
                const FontVariation("wdth", 100),
                // 10-16
                FontVariation("opsz", opszAnimation.value),
              ],
            ),
          );
        },
      ),
    );
  }
}
