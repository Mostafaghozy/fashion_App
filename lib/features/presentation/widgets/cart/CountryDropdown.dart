import 'package:flutter/material.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String? selectedCountry;

  final List<String> countries = [
    'Egypt',
    'United States',
    'United Kingdom',
    'Canada',
    'Germany',
    'France',
    'Italy',
    'Saudi Arabia',
    'United Arab Emirates',
    'India',
    'Japan',
    'China',
    'Australia',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selectedCountry,

        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: Colors.black,
        iconEnabledColor: Colors.grey.shade700,
        style: TextStyle(color: Colors.grey.shade700),
        items: countries.map((String country) {
          return DropdownMenuItem<String>(value: country, child: Text(country));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCountry = newValue;
          });
        },
      ),
    );
  }
}
