import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryImageHeader extends StatelessWidget {
  const CategoryImageHeader({
    super.key,
    required this.eventCategory,
    this.height,
    this.margin,
  });

  final CategoryModel eventCategory;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 193.h,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: context.customColors.stroke),
        color: context.customColors.inputs,
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(
            context.isDark
                ? eventCategory.imagePathDark
                : eventCategory.imagePathLight,
          ),
          fit: BoxFit.fill,
        ),
      ),
      clipBehavior: Clip.antiAlias,
    );
  }
}
