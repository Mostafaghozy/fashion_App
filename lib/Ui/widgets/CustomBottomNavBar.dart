import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            imagePath: "assets/icons/Home.png",
            label: 'Home',
            index: 0,
            isActive: currentIndex == 0,
          ),
          _buildNavItem(
            imagePath: "assets/icons/Search.png",
            label: 'Search',
            index: 1,
            isActive: currentIndex == 1,
          ),
          _buildNavItem(
            imagePath: "assets/icons/Bag 2.png",

            label: 'Cart',
            index: 2,
            isActive: currentIndex == 2,
            hasBadge: true,
            // badgeCount: 1,
          ),
          _buildNavItem(
            imagePath: "assets/icons/Heart.png",

            label: 'Wishlist',
            index: 3,
            isActive: currentIndex == 3,
          ),
          _buildNavItem(
            imagePath: "assets/icons/Notification.png",

            label: 'Notification',
            index: 4,
            isActive: currentIndex == 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    IconData? icon,
    String? imagePath,
    String? activeImagePath,
    required String label,
    required int index,
    required bool isActive,
    bool hasBadge = false,
    int badgeCount = 0,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                if (imagePath != null && imagePath.isNotEmpty)
                  Image.asset(
                    isActive && activeImagePath != null
                        ? activeImagePath
                        : imagePath,
                    width: 24,
                    height: 24,
                    color: isActive ? Colors.yellow[600] : Colors.white,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to icon if image fails to load
                      return Icon(
                        icon ?? Icons.error_outline,
                        size: 24,
                        color: isActive ? Colors.yellow[600] : Colors.white,
                      );
                    },
                  )
                else if (icon != null)
                  Icon(
                    icon,
                    size: 24,
                    color: isActive ? Colors.yellow[600] : Colors.white,
                  ),
                if (hasBadge && badgeCount > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          badgeCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.yellow[600] : Colors.white,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
