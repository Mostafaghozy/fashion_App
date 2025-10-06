import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  int selectedColorIndex = 0;
  String selectedSize = "S";

  final List<Color> colors = [
    const Color.fromARGB(255, 207, 218, 135),
    const Color.fromRGBO(243, 167, 167, 1),
    const Color.fromRGBO(156, 196, 219, 1),
    const Color.fromARGB(255, 160, 230, 111),
    const Color(0xFFA8A055),
  ];

  final List<String> sizes = ["S", "M", "L"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            right: 5,
            child: Center(
              child: Image.asset('assets/all_product/m.png', fit: BoxFit.cover),
            ),
          ),

          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black54,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.black54,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFFFFAEF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Women’s levi’s denims",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$82.99",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    "Levi’s denim will perfectly complement your image. "
                    "This denim is suitable for both classic style and for \ncasual style.",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Color",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: List.generate(colors.length, (index) {
                      final bool isSelected = selectedColorIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? colors[index]
                                : colors[index].withOpacity(0.8),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.30),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                    ),
                                  ]
                                : [],

                            border: Border.all(
                              color: Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: selectedColorIndex == index
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: 20,
                                )
                              : null,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Size",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 📏 المقاسات
                  Row(
                    children: sizes.map((size) {
                      final isSelected = selectedSize == size;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(80),
                            color: isSelected ? Colors.black : Colors.white,
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.transparent),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (quantity > 1) {
                                  setState(() => quantity--);
                                }
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                  color: Colors.black45,
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(width: 12),

                            GestureDetector(
                              onTap: () {
                                setState(() => quantity++);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 55,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/Bag3.png", height: 22),
                            const SizedBox(width: 10),
                            const Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
