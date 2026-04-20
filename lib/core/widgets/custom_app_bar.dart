import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/back_widget.dart';
import 'package:evently/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final Color? backgroundColor;
  final bool?hasActions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackTap,
    this.backgroundColor,
     this.hasActions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? context.customColors.background,
      title: CustomText(
        text: title,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        textColor: context.customColors.mainText,
      ),
      centerTitle: true,
      leading: showBackButton
          ? Center(child: BackWidget(onTap: onBackTap))
          : null,
      actions: hasActions == true ? actions : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
