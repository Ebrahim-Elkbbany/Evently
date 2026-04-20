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
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 450.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: context.customColors.primary,
                ),
              ),
            ),
          );
        } else if (homeProvider.state == HomeViewState.failure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Center(
                child: Text(
                  homeProvider.errorMessage ?? context.lan.somethingWentWrong,
                ),
              ),
            ),
          );
        } else if (homeProvider.events.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: Text(
                  context.lan.no_events_found,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ),
          );
        } else {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: EventCard(event: homeProvider.events[index]),
                );
              }, childCount: homeProvider.events.length),
            ),
          );
        }
      },
    );
  }
}
