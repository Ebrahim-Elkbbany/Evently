import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/features/home/presentation/manager/home_provider.dart';
import 'package:evently/features/profile/presentation/manager/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.viewPaddingOf(context).top + 16.h,
        bottom: 8.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.lan.welcome_back} ✨',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.customColors.secondaryText,
                      ),
                    ),
                    context.gapH(4),
                    Consumer<ProfileProvider>(
                      builder: (context, profileProvider, child) {
                        return profileProvider.isLoading
                            ? SizedBox.shrink()
                            : Text(
                                profileProvider.user!.name,
                                style: context.textTheme.titleLarge?.copyWith(
                                  color: context.customColors.mainText,
                                ),
                              );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      context.theme.brightness == Brightness.dark
                          ? Icons.nightlight_round
                          : Icons.wb_sunny_outlined,
                      color: context.theme.brightness == Brightness.dark
                          ? Colors.white
                          : context.customColors.primary,
                    ),
                    context.gapW(8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.customColors.primary,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        context.lan.language == 'Language' ? 'EN' : 'AR',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          context.gapH(20),
          Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return CustomTabBar(
                tabs: CategoryModel.getCategoriesList(context),
                selectedIndex: provider.selectedTabIndex,
                onTabChanged: (index) {
                  provider.changeTabIndex(index);
                },
              );
            },
          ),
          context.gapH(16),
        ],
      ),
    );
  }
}
