import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/layout/presentation/widgets/custom_bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Layout View')),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          customBottomNavBarItem(
            label: context.lan.home,
            icon: Icons.home,
            context: context,
          ),
          customBottomNavBarItem(
            label: context.lan.home,
            icon: Icons.home,
            context: context,
          ),
          customBottomNavBarItem(
            label: context.lan.home,
            icon: Icons.home,
            context: context,
          ),
        ],
      ),
    );
  }
}
