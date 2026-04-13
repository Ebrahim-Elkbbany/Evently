import 'package:evently/core/models/tab_bar_model.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final List<TabItemModel> tabs;
  final int selectedIndex;
  final Function(int) onTabChanged;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (context, index) => context.gapW(8),
        itemBuilder: (context, index) {
          return CustomTabItem(
            title: tabs[index].title,
            iconData: tabs[index].icon,
            isSelected: selectedIndex == index,
            onTap: () => onTabChanged(index),
          );
        },
      ),
    );
  }
}
