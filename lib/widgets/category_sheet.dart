import 'package:flutter/material.dart';

import 'category_list.dart';
import 'clout_header.dart';
import 'segmented_list.dart';

class CategorySheet extends StatelessWidget {
  final List<CategoryList> categories;
  final String selectedCategory;
  final ValueChanged<CategoryList> onCategorySelected;

  const CategorySheet({
    super.key,
    required this.categories,
    this.selectedCategory = '',
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Choose Category'),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(15, kToolbarHeight + topInset, 15, 100),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.value == selectedCategory;

          return SegmentedListItem(
            key: ValueKey(category.value),
            index: index,
            count: categories.length,
            selected: isSelected,
            onTap: () => onCategorySelected(category),
            trailing: Icon(
              category.icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
            title: category.label,
          );
        },
      ),
    );
  }
}
