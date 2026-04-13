import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
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
      floatingActionButton: layoutProvider.currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                context.pushNamed(AppRoutes.addEventView);
              },
              backgroundColor: context.customColors.primary,
              shape: CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 24),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: layoutProvider.currentIndex,
        onTap: (index) {
          context.read<LayoutProvider>().changeCurrentIndex(index);
        },
        items: [
          customBottomNavBarItem(
            label: context.lan.home,
            icon: Icons.home,
            context: context,
          ),
          customBottomNavBarItem(
            label: context.lan.favourite,
            icon: Icons.favorite,
            context: context,
          ),
          customBottomNavBarItem(
            label: context.lan.profile,
            icon: Icons.person,
            context: context,
          ),
        ],
      ),
    );
  }
}
