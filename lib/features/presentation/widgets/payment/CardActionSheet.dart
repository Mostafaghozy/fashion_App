import 'package:flutter/material.dart';

class CardActionSheet extends StatelessWidget {
  final String cardType;
  final String maskedNumber;
  final bool isDefault;
  final VoidCallback onSetDefault;
  final VoidCallback onDelete;

  const CardActionSheet({
    super.key,
    required this.cardType,
    required this.maskedNumber,
    required this.isDefault,
    required this.onSetDefault,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xE61C1C1E), // More transparent, blends with navbar
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ), // Less pronounced
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade700, // More muted handle
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Card info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardType,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      maskedNumber,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                if (isDefault)
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amberAccent),
                    ),
                    child: const Text(
                      'Default',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),

          Divider(color: Colors.grey.shade800, height: 1),

          // Actions
          if (!isDefault) ...[
            ListTile(
              leading: const Icon(
                Icons.check_circle_outline,
                color: Color.fromARGB(204, 165, 161, 35),
              ),
              title: Text(
                'Set as default',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                onSetDefault();
              },
            ),
            Divider(color: Colors.grey.shade800, height: 1),
          ],

          ListTile(
            leading: Icon(
              Icons.close_rounded,
              color: Color.fromARGB(204, 165, 161, 35),
            ),
            title: Text('Delete card', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              onDelete();
            },
          ),

          // Cancel button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Color.fromARGB(204, 165, 161, 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
