import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final bool showIcon;
  final IconData? icon;

  const FormFieldWidget({
    Key? key,
    required this.label,
    this.showIcon = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 240,
        minHeight: 34,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE2E2E2),
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (showIcon && icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  icon,
                  size: 18,
                  color: const Color(0xFF819AA7),
                ),
              ),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF819AA7),
                  fontSize: 12,
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
