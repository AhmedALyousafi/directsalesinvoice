import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String label;
  final bool hasDropdown;
  final TextInputType? keyboardType;

  const FormInputField({
    super.key,
    required this.label,
    this.hasDropdown = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE2E2E2)),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (hasDropdown)
            const Icon(
              Icons.arrow_drop_down,
              size: 18,
              color: Color(0xFF819AA7),
            ),
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.right,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF819AA7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
