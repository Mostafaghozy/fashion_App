import 'package:e_commerce/presentation/widgets/category/section_title.dart';
import 'package:flutter/material.dart';

class RecentSearchWidget extends StatelessWidget {
  final List<String> recentSearches;
  final Function(String)? onSearchTap;
  final Function()? onClearAll;

  const RecentSearchWidget({
    super.key,
    this.recentSearches = const [],
    this.onSearchTap,
    this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    if (recentSearches.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitle(title: 'Recent search'),
            TextButton(
              onPressed: onClearAll,
              child: Text(
                'Clear all',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: recentSearches.map((search) {
            return GestureDetector(
              onTap: () => onSearchTap?.call(search),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  search,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
