import 'package:hugeicons/hugeicons.dart';

class CategoryList {
  final String value;
  final String label;
  final dynamic icon; // was IconData — Hugeicons' icon data isn't IconData

  const CategoryList({
    required this.value,
    required this.label,
    required this.icon,
  });

  static String labelFor(String value) {
    for (final option in allOptions) {
      if (option.value == value) return option.label;
    }
    return "Choose a category";
  }

  static dynamic iconFor(String value) {
    for (final option in allOptions) {
      if (option.value == value) return option.icon;
    }
    return HugeIcons.strokeRoundedGrid; // fallback — VERIFY this name
  }

  static const List<CategoryList> allOptions = [
    CategoryList(
      value: 'art',
      label: 'Art and Photography',
      icon: HugeIcons.strokeRoundedPaintBoard, // VERIFY
    ),
    CategoryList(
      value: 'automotive',
      label: 'Automotive',
      icon: HugeIcons.strokeRoundedCar01, // VERIFY
    ),
    CategoryList(
      value: 'beauty',
      label: 'Beauty and Makeup',
      icon: HugeIcons.strokeRoundedFaceId, // VERIFY — or strokeRoundedLipstick
    ),
    CategoryList(
      value: 'business',
      label: 'Business',
      icon: HugeIcons.strokeRoundedBriefcase01, // VERIFY
    ),
    CategoryList(
      value: 'diversity',
      label: 'Diversity and Inclusion',
      icon: HugeIcons.strokeRoundedUserGroup, // VERIFY
    ),
    CategoryList(
      value: 'education',
      label: 'Education',
      icon: HugeIcons
          .strokeRoundedGraduationScroll, // VERIFY — or strokeRoundedSchool01
    ),
    CategoryList(
      value: 'entertainment',
      label: 'Entertainment',
      icon: HugeIcons.strokeRoundedTheater, // VERIFY — or strokeRoundedTicket01
    ),
    CategoryList(
      value: 'fashion',
      label: 'Fashion',
      icon: HugeIcons.strokeRoundedShirt01, // VERIFY — or strokeRoundedHanger
    ),
    CategoryList(
      value: 'finance',
      label: 'Finance',
      icon: HugeIcons
          .strokeRoundedMoney03, // VERIFY — or strokeRoundedDollarCircle
    ),
    CategoryList(
      value: 'food',
      label: 'Food and Beverage',
      icon: HugeIcons.strokeRoundedRestaurant01, // VERIFY
    ),
    CategoryList(
      value: 'gaming',
      label: 'Gaming',
      icon: HugeIcons.strokeRoundedGameController01, // VERIFY
    ),
    CategoryList(
      value: 'health',
      label: 'Health and Wellness',
      icon: HugeIcons.strokeRoundedFavourite, // VERIFY — or strokeRoundedHealth
    ),
    CategoryList(
      value: 'home',
      label: 'Home and Gardening',
      icon: HugeIcons.strokeRoundedPlant02, // VERIFY — or strokeRoundedGarden
    ),
    CategoryList(
      value: 'outdoor',
      label: 'Outdoor and Nature',
      icon: HugeIcons.strokeRoundedTree01, // VERIFY — or strokeRoundedForest
    ),
    CategoryList(
      value: 'parenting',
      label: 'Parenting and Family',
      icon: HugeIcons.strokeRoundedHouseHeart, // VERIFY
    ),
    CategoryList(
      value: 'pets',
      label: 'Pets',
      icon: HugeIcons.strokeRoundedCat, // VERIFY — or strokeRoundedPaw
    ),
    CategoryList(
      value: 'sports',
      label: 'Sports and Fitness',
      icon: HugeIcons
          .strokeRoundedBicepsFlexed, // VERIFY — or strokeRoundedDumbbell01
    ),
    CategoryList(
      value: 'technology',
      label: 'Technology',
      icon: HugeIcons.strokeRoundedComputer, // VERIFY
    ),
    CategoryList(
      value: 'travel',
      label: 'Travel',
      icon: HugeIcons
          .strokeRoundedAirplane01, // VERIFY — package docs confirm "AirplaneSeat" exists, this may differ
    ),
    CategoryList(
      value: 'videography',
      label: 'Videography',
      icon: HugeIcons.strokeRoundedVideo01, // VERIFY — or strokeRoundedCamera02
    ),
  ];
}
