import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/event_card.dart';
import 'package:evently/features/home/presentation/manager/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeEventsSection extends StatelessWidget {
  const HomeEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        if (homeProvider.state == HomeViewState.loading) {
          return SizedBox(
            height: 450.h,
            child: Center(
              child: CircularProgressIndicator(
                color: context.customColors.primary,
              ),
            ),
          );
        } else if (homeProvider.state == HomeViewState.failure) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Center(
              child: Text(
                homeProvider.errorMessage ?? context.lan.somethingWentWrong,
              ),
            ),
          );
        } else if (homeProvider.events.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: Text(
                context.lan.noDataFound,
                style: context.textTheme.titleMedium,
              ),
            ),
          );
        } else {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeProvider.events.length,
            itemBuilder: (context, index) {
              return EventCard(event: homeProvider.events[index]);
            },
            separatorBuilder: (context, index) => context.gapH(16),
          );
        }
      },
    );
  }
}
