import 'package:evently/features/home/presentation/view/widgets/home_events_section.dart';
import 'package:evently/features/home/presentation/view/widgets/home_header_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [HomeHeaderSection(), HomeEventsSection()]),
    );
  }
}
