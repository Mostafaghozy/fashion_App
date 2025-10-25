import 'package:flutter/material.dart';

class HomeFilterSheet extends StatefulWidget {
  const HomeFilterSheet({super.key});

  @override
  State<HomeFilterSheet> createState() => _HomeFilterSheetState();
}

class _HomeFilterSheetState extends State<HomeFilterSheet> {
  final List<String> categories = [
    'All',
    "Men's",
    "Women's",
    'Kids',
    'Accessories',
  ];

  final List<Color> colorOptions = const [
    Color(0xFF1F1F1F),
    Color(0xFFE57373),
    Color(0xFF81C784),
    Color(0xFF64B5F6),
    Color(0xFFFFD54F),
    Color(0xFFB39DDB),
    Color(0xFFFFA726),
    Color(0xFFCDDC39),
  ];

  String selectedCategory = 'All';
  int? selectedColorIndex;
  double maxPrice = 100;
  int selectedRating = 4; // 4 & up by default

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + bottomInset),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Text(
                'FILTER',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 14),
              _buildSectionTitle('Categories'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 8,
                children: [
                  for (final c in categories)
                    ChoiceChip(
                      label: Text(c),
                      selected: selectedCategory == c,
                      onSelected: (_) => setState(() => selectedCategory = c),
                      labelStyle: TextStyle(
                        color: selectedCategory == c
                            ? Colors.black
                            : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      selectedColor: const Color(0xFFF2F2F2),
                      backgroundColor: const Color(0xFFF8F8F8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: selectedCategory == c
                              ? Colors.black
                              : const Color(0xFFDDDDDD),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('Colors'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 14,
                children: [
                  for (int i = 0; i < colorOptions.length; i++)
                    _ColorDot(
                      color: colorOptions[i],
                      selected: selectedColorIndex == i,
                      onTap: () => setState(() => selectedColorIndex = i),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('Price range'),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('0', style: TextStyle(color: Colors.black54)),
                  Text(
                    '${maxPrice.toInt()} \$',
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
              Slider(
                value: maxPrice,
                min: 0,
                max: 100,
                activeColor: Colors.black,
                inactiveColor: Colors.black12,
                onChanged: (v) => setState(() => maxPrice = v),
              ),
              const SizedBox(height: 6),
              // _buildSectionTitle('Customer reviews'),
              // const SizedBox(height: 6),
              // for (int r = 4; r >= 2; r--)
              //   _RatingRow(
              //     rating: r,
              //     selected: selectedRating == r,
              //     onChanged: () => setState(() => selectedRating = r),
              //   ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'All';
                          selectedColorIndex = null;
                          maxPrice = 50;
                          selectedRating = 4;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                      ),
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Apply'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _ColorDot({
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: selected ? Colors.black : Colors.white,
            width: 2,
          ),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
        ),
        child: selected
            ? const Icon(Icons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }
}
