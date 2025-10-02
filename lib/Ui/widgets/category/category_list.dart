import 'package:flutter/material.dart';
import 'category_item.dart';

typedef CategorySelected = void Function(int index);

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
    required this.images,
    required this.labels,
    this.initialIndex = 0,
    this.onSelected,
  });

  final List<String> images;
  final List<String> labels;
  final int initialIndex;
  final CategorySelected? onSelected;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.labels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 5),
        itemBuilder: (context, index) {
          final label = widget.labels[index];
          final img = widget.images[index % widget.images.length];
          return CategoryItem(
            imagePath: img,
            label: label,
            isActive: index == selectedIndex,
            onTap: () {
              setState(() => selectedIndex = index);
              widget.onSelected?.call(index);
            },
          );
        },
      ),
    );
  }
}
