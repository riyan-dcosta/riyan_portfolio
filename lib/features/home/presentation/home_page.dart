import 'package:flutter/material.dart';
import 'package:riyan_portfolio/features/dashboard/presentation/view/dashboard_page.dart';
import 'package:riyan_portfolio/features/home/presentation/controller/home_tab_controller.dart';
import 'package:riyan_portfolio/features/todo/presentation/todo_page.dart';

import 'controller/theme_changer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.themeChanger});

  final ThemeChanger themeChanger;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ThemeChanger themeChanger;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: TabViews.pages.length,
      vsync: this,
      initialIndex: 0,
    );
    themeChanger = widget.themeChanger;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.pages.length,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ListenableBuilder(
              listenable: themeChanger,
              builder: (context, child) {
                final currentTheme = themeChanger.getCurrentTheme;
                return SliverAppBar(
                  floating: true,
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
                    Row(
                        children: TabViews.pages
                            .map((e) => ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(10))),
                                onPressed: () {
                                  tabController
                                      .animateTo(TabViews.pages.indexOf(e));
                                },
                                child: Text(e)))
                            .toList())
                  ],
                );
              },
            ),
            SliverFillRemaining(
              child: TabBarView(controller: tabController, children: [
                DashboardPage(),
                TodoPage(),
              ]),
            ),
            const SliverToBoxAdapter(
              child: Row(
                children: [Text("Flutter version : ")],
              ),
            )
          ],
        ),
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
