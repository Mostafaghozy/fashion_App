import 'package:e_commerce/features/presentation/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/features/presentation/screens/home/MainScreen.dart';

import 'package:flutter/material.dart';
import '../../custom_input_field.dart';

class EditAddressBook extends StatefulWidget {
  const EditAddressBook({super.key});

  @override
  State<EditAddressBook> createState() => _EditAddressBookState();
}

class _EditAddressBookState extends State<EditAddressBook> {
  final TextEditingController _fullNameController = TextEditingController(
    text: 'Ashan Niroshana',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+94 71 123 432 7',
  );
  final TextEditingController _addressController = TextEditingController(
    text: '12A, colombo road',
  );
  final TextEditingController _cityController = TextEditingController(
    text: 'Colombo',
  );
  final TextEditingController _zipController = TextEditingController(
    text: '80120',
  );

  final List<String> _provinces = <String>[
    'western province',
    'central province',
    'southern province',
    'eastern province',
    'northern province',
    'north western',
    'north central',
    'uva',
    'sabaragamuwa',
  ];

  String _selectedProvince = 'western province';
  String _addressType = 'Home';
  bool _saveAsDefault = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Edit your delivery address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 30),

            CustomInputField(
              label: 'Full name',
              child: TextFormField(
                controller: _fullNameController,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Phone number
            CustomInputField(
              label: 'Phone number',
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Address
            CustomInputField(
              label: 'Address',
              child: TextFormField(
                controller: _addressController,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Province dropdown using CustomInputField-like container
            CustomInputField(
              label: 'Province',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedProvince,
                  isExpanded: true,
                  items: _provinces
                      .map(
                        (p) =>
                            DropdownMenuItem<String>(value: p, child: Text(p)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _selectedProvince = value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),

            // City
            CustomInputField(
              label: 'City',
              child: TextFormField(
                controller: _cityController,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Zip code
            CustomInputField(
              label: 'Zip code',
              child: TextFormField(
                controller: _zipController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Address type chips
            Row(
              children: [
                _TypeChip(
                  label: 'Home',
                  selected: _addressType == 'Home',
                  onTap: () => setState(() => _addressType = 'Home'),
                ),
                const SizedBox(width: 15),
                _TypeChip(
                  label: 'Office',
                  selected: _addressType == 'Office',
                  onTap: () => setState(() => _addressType = 'Office'),
                ),
              ],
            ),
            const SizedBox(height: 5),

            Row(
              children: [
                Checkbox(
                  value: _saveAsDefault,
                  onChanged: (v) => setState(() => _saveAsDefault = v ?? false),
                ),
                const SizedBox(width: 8),
                const Text('Save to default address'),
              ],
            ),
            SizedBox(height: 16),
            SafeArea(
              minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Address saved')),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add new address'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}

// Unused legacy container kept for reference has been removed.

class _TypeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TypeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color defaultIconColor =
        Theme.of(context).iconTheme.color ?? Colors.grey;
    final Color defaultTextColor =
        Theme.of(context).textTheme.labelMedium?.color ?? Colors.grey;
    final Color activeColor = Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? Colors.white
                : Theme.of(context).dividerColor.withOpacity(0.6),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              label == 'Home' ? Icons.home_filled : Icons.apartment_rounded,
              size: 16,
              color: selected ? activeColor : defaultIconColor,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: selected ? activeColor : defaultTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
