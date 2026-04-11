import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/layout/manager/layout_provider.dart';
import 'package:evently/features/layout/presentation/widgets/custom_bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutProvider = context.watch<LayoutProvider>();
    return Scaffold(
      body: layoutProvider.screens[layoutProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: layoutProvider.currentIndex,
        onTap: (index) {
          context.read<LayoutProvider>().changeCurrentIndex(index);
        },
        items: [
          customBottomNavBarItem(
            label: context.lan.home,
            icon: Icons.home_outlined,
            context: context,
          ),
          customBottomNavBarItem(
            label: context.lan.home,
            icon: Icons.favorite_outlined,
            context: context,
          ),
          customBottomNavBarItem(
            label: context.lan.home,
            icon: Icons.person_outline,
            context: context,
          ),
        ],
      ),
    );
  }
}
