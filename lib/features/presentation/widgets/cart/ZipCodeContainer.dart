import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZipCodeContainer extends StatelessWidget {
  const ZipCodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(width: 1, color: Colors.grey.shade700),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
            keyboardType: TextInputType.number,

            style: TextStyle(color: Colors.grey.shade700),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(5),
            ],
          ),
        ),
      ),
    );
  }
}
