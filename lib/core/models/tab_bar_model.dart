import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TabItemModel {
  final String id;
  final String title;
  final IconData icon;

  const TabItemModel({
    required this.title,
    required this.icon,
    required this.id,
  });

  static List<TabItemModel> getTabBarList(BuildContext context) {
    return [
      TabItemModel(
        id: "0",
        title: context.lan.all,
        icon: Icons.grid_view_rounded,
      ),
      TabItemModel(
        id: "1",
        title: context.lan.sports,
        icon: Icons.directions_bike_outlined,
      ),
      TabItemModel(
        id: "2",
        title: context.lan.birthday,
        icon: Icons.cake_outlined,
      ),
      TabItemModel(
        id: "3",
        title: context.lan.book_club,
        icon: Icons.menu_book_rounded,
      ),
      TabItemModel(
        id: "4",
        title: context.lan.exhibition,
        icon: Icons.festival_outlined,
      ),
    ];
  }
  static List<TabItemModel> getTabBarListWithoutAll(BuildContext context) {
    return [
      TabItemModel(
        id: "1",
        title: context.lan.sports,
        icon: Icons.directions_bike_outlined,
      ),
      TabItemModel(
        id: "2",
        title: context.lan.birthday,
        icon: Icons.cake_outlined,
      ),
      TabItemModel(
        id: "3",
        title: context.lan.book_club,
        icon: Icons.menu_book_rounded,
      ),
      TabItemModel(
        id: "4",
        title: context.lan.exhibition,
        icon: Icons.festival_outlined,
      ),
    ];
  }
}
