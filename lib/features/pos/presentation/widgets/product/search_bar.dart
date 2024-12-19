import 'dart:math';

import 'package:flutter/material.dart';

class SearchBar1 extends StatelessWidget {
  final bool showImages;
  final VoidCallback onToggleShowImages;
  final Function(String) onSearch; // callback للبحث

  const SearchBar1({
    super.key,
    required this.showImages,
    required this.onToggleShowImages,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      height: 45,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            // الأيقونات في الجانب الأيسر
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xFFD9EDFB),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onToggleShowImages,
                    icon: Icon(
                      Icons.remove_red_eye,
                      color:
                          !showImages ? Color(0xFF03045E) : Color(0xFF819AA7),
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.all(4),
                  ),
                  IconButton(
                    onPressed: onToggleShowImages,
                    icon: Icon(
                      Icons.image,
                      color: showImages ? Color(0xFF03045E) : Colors.grey,
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.all(4),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // حقل البحث
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Icon(
                        Icons.search,
                        color: Color(0xFF819AA7),
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: 'بحث في القائمة',
                          hintStyle: TextStyle(
                            color: Color(0xFF819AA7),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Readex Pro',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onChanged: onSearch, // إدخال النص
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
