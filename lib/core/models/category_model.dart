import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final IconData icon;
  final String imagePathLight;
  final String imagePathDark;

  const CategoryModel({
    required this.title,
    required this.icon,
    required this.id,
    required this.imagePathLight,
    required this.imagePathDark,
  });

  static List<CategoryModel> getCategoriesList(BuildContext context) {
    return [
      CategoryModel(
        id: "0",
        title: context.lan.all,
        icon: Icons.grid_view_rounded,
        imagePathLight: "",
        imagePathDark: "",
      ),
      CategoryModel(
        id: "1",
        title: context.lan.sports,
        icon: Icons.directions_bike_outlined,
        imagePathLight: AppImages.sportsLight,
        imagePathDark: AppImages.sportsDark,
      ),
      CategoryModel(
        id: "2",
        title: context.lan.birthday,
        icon: Icons.cake_outlined,
        imagePathLight: AppImages.birthdayLight,
        imagePathDark: AppImages.birthdayDark,
      ),
      CategoryModel(
        id: "3",
        title: context.lan.book_club,
        icon: Icons.menu_book_rounded,
        imagePathLight: AppImages.booksClubLight,
        imagePathDark: AppImages.booksClubDark,
      ),
      CategoryModel(
        id: "4",
        title: context.lan.exhibition,
        icon: Icons.festival_outlined,
        imagePathLight: AppImages.exhibitionLight,
        imagePathDark: AppImages.exhibitionDark,
      ),
      CategoryModel(
        id: "5",
        title: context.lan.meetings,
        icon: Icons.meeting_room_outlined,
        imagePathLight: AppImages.meetingLight,
        imagePathDark: AppImages.meetingDark,
      ),
    ];
  }

  static List<CategoryModel> getCategoriesWithoutAll(BuildContext context) {
    return [
      CategoryModel(
        id: "1",
        title: context.lan.sports,
        icon: Icons.directions_bike_outlined,
        imagePathLight: AppImages.sportsLight,
        imagePathDark: AppImages.sportsDark,
      ),
      CategoryModel(
        id: "2",
        title: context.lan.birthday,
        icon: Icons.cake_outlined,
        imagePathLight: AppImages.birthdayLight,
        imagePathDark: AppImages.birthdayDark,
      ),
      CategoryModel(
        id: "3",
        title: context.lan.book_club,
        icon: Icons.menu_book_rounded,
        imagePathLight: AppImages.booksClubLight,
        imagePathDark: AppImages.booksClubDark,
      ),
      CategoryModel(
        id: "4",
        title: context.lan.exhibition,
        icon: Icons.festival_outlined,
        imagePathLight: AppImages.exhibitionLight,
        imagePathDark: AppImages.exhibitionDark,
      ),
      CategoryModel(
        id: "5",
        title: context.lan.meetings,
        icon: Icons.meeting_room_outlined,
        imagePathLight: AppImages.meetingLight,
        imagePathDark: AppImages.meetingDark,
      ),
    ];
  }
}
