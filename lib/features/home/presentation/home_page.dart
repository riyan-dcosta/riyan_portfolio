import 'package:flutter/material.dart';
import 'package:riyan_portfolio/features/home/controller/theme_changer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.themeChanger});

  final ThemeChanger themeChanger;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeChanger themeChanger;

  @override
  void initState() {
    super.initState();
    themeChanger = widget.themeChanger;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ListenableBuilder(
            listenable: themeChanger,
            builder: (context, child) {
              final currentTheme = themeChanger.getCurrentTheme;
              return SliverAppBar(
                floating: true,
                // snap: true,
                pinned: true,
                title: const Text("Riyan Dcosta"),
                actions: [
                  IconButton(
                      onPressed: () {
                        themeChanger.switchTheme();
                      },
                      icon: Icon(
                        currentTheme == ThemeMode.dark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      )),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Projects"))
                ],
              );
            },
          ),
          const SliverFillRemaining(
            child: Center(
              child: Text("Loading..."),
            ),
          ),
          const SliverToBoxAdapter(
            child: Row(
              children: [Text("Flutter version : ")],
            ),
          )
        ],
      ),
    );
  }
}

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;

  CustomPersistentHeader({required this.backgroundColor});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const Row(
      children: [Text("Flutter")],
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant CustomPersistentHeader oldDelegate) {
    return backgroundColor != oldDelegate.backgroundColor;
  }
}
