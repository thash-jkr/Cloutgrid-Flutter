import 'package:flutter/material.dart';

class CategoryList {
  final String value;
  final String label;
  final IconData icon;

  const CategoryList({
    required this.value,
    required this.label,
    required this.icon,
  });

  static String labelFor(String value) {
    for (final option in allOptions) {
      if (option.value == value) return option.label;
    }
    return '';
  }

  static IconData iconFor(String value) {
    for (final option in allOptions) {
      if (option.value == value) return option.icon;
    }
    return Icons.category_rounded;
  }

  static const List<CategoryList> allOptions = [
    CategoryList(
      value: 'art',
      label: 'Art and Photography',
      icon: Icons.palette_rounded,
    ),
    CategoryList(
      value: 'automotive',
      label: 'Automotive',
      icon: Icons.directions_car_rounded,
    ),
    CategoryList(
      value: 'beauty',
      label: 'Beauty and Makeup',
      icon: Icons.face_rounded,
    ),
    CategoryList(
      value: 'business',
      label: 'Business',
      icon: Icons.business_center_rounded,
    ),
    CategoryList(
      value: 'diversity',
      label: 'Diversity and Inclusion',
      icon: Icons.diversity_3_rounded,
    ),
    CategoryList(
      value: 'education',
      label: 'Education',
      icon: Icons.school_rounded,
    ),
    CategoryList(
      value: 'entertainment',
      label: 'Entertainment',
      icon: Icons.theaters_rounded,
    ),
    CategoryList(
      value: 'fashion',
      label: 'Fashion',
      icon: Icons.checkroom_rounded,
    ),
    CategoryList(
      value: 'finance',
      label: 'Finance',
      icon: Icons.attach_money_rounded,
    ),
    CategoryList(
      value: 'food',
      label: 'Food and Beverage',
      icon: Icons.restaurant_rounded,
    ),
    CategoryList(
      value: 'gaming',
      label: 'Gaming',
      icon: Icons.sports_esports_rounded,
    ),
    CategoryList(
      value: 'health',
      label: 'Health and Wellness',
      icon: Icons.favorite_rounded,
    ),
    CategoryList(
      value: 'home',
      label: 'Home and Gardening',
      icon: Icons.yard_rounded,
    ),
    CategoryList(
      value: 'outdoor',
      label: 'Outdoor and Nature',
      icon: Icons.park_rounded,
    ),
    CategoryList(
      value: 'parenting',
      label: 'Parenting and Family',
      icon: Icons.family_restroom_rounded,
    ),
    CategoryList(value: 'pets', label: 'Pets', icon: Icons.pets_rounded),
    CategoryList(
      value: 'sports',
      label: 'Sports and Fitness',
      icon: Icons.sports_basketball_rounded,
    ),
    CategoryList(
      value: 'technology',
      label: 'Technology',
      icon: Icons.computer_rounded,
    ),
    CategoryList(value: 'travel', label: 'Travel', icon: Icons.flight_rounded),
    CategoryList(
      value: 'videography',
      label: 'Videography',
      icon: Icons.videocam_rounded,
    ),
  ];
}
