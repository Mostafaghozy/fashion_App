import 'package:e_commerce/Ui/widgets/HomeFilterSheet.dart';
import 'package:flutter/material.dart';

class CollectionsFilterBar extends StatefulWidget {
  const CollectionsFilterBar({super.key});

  @override
  State<CollectionsFilterBar> createState() => _CollectionsFilterBarState();
}

class _CollectionsFilterBarState extends State<CollectionsFilterBar> {
  String selected = "All collections";

  final List<String> filters = [
    "All collections",
    "Trousers",
    "Denims",
    "Short",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((item) {
                  final bool isSelected = selected == item;
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = item;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white54
                              : const Color.fromARGB(22, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: isSelected
                                ? Colors.white54
                                : Color.fromARGB(9, 255, 255, 255),
                          ),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (ctx) => const HomeFilterSheet(), //filterSheet
              );
            },
          ),
        ],
      ),
    );
  }
}
