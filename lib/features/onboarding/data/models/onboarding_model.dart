import 'package:evently/core/utils/constants/assets_paths.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String? subtitle;

  OnboardingModel({required this.image, required this.title, this.subtitle});

  static List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: AppImages.onboarding1,
      title: 'Personalize Your Experience',
      subtitle:
          'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
    ),
    OnboardingModel(
      image: AppImages.onboarding2,
      title: 'Find Events That Inspire You',
      subtitle:
          'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
    ),
    OnboardingModel(
      image: AppImages.onboarding3,
      title: 'Effortless Event Planning',
      subtitle:
          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
    ),
    OnboardingModel(
      image: AppImages.onboarding4,
      title: 'Connect with Friends & Share Moments',
      subtitle:
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.s',
    ),
  ];
}
