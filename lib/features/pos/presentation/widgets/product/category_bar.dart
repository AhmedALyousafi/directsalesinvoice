import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  final Function(String) onCategorySelected; // callback لتحديد الفئة

  const CategoryBar({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> categories = [
    {'title': 'الاكثر مبيعا', 'isHighlighted': true},
    {'title': 'اجهزة كهربائية', 'isHighlighted': false},
    {'title': 'الأجهزة المنزلية', 'isHighlighted': false},
    {'title': 'الترامس وتقديمات الضيافة', 'isHighlighted': false},
    {'title': 'المعالق والسكاكين', 'isHighlighted': false},
    {'title': 'أواني الطهي وأدوات المطبخ', 'isHighlighted': false},
    {'title': 'العناية الشخصية', 'isHighlighted': false},
    {'title': 'كشتات', 'isHighlighted': false},
    {'title': 'العناية بالمنزل وأدوات التنظيف', 'isHighlighted': false},
  ];

  String currentSearchQuery = ''; // النص الذي يتم البحث فيه

  @override
  Widget build(BuildContext context) {
    // فلترة الفئات بناءً على النص الذي تم إدخاله في البحث
    List<Map<String, dynamic>> filteredCategories = categories
        .where((category) => category['title']
            .toLowerCase()
            .contains(currentSearchQuery.toLowerCase()))
        .toList();

    return Row(
      children: [
        // إضافة الأيقونة هنا على اليسار
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF00B4D8),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            Icons.filter_list_alt,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 8), // المسافة بين الأيقونة والقائمة
        Expanded(
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Scrollbar(
                      controller: _scrollController,
                      thickness: 3,
                      radius: const Radius.circular(4),
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        child: Row(
                          children: filteredCategories.map((category) {
                            return GestureDetector(
                              onTap: () {
                                widget.onCategorySelected(category['title']);
                              },
                              child: _buildCategoryItem(
                                category['title'],
                                isHighlighted: category['isHighlighted'],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String text, {bool isHighlighted = false}) {
    return InkWell(
      onTap: () {
        setState(() {
          categories.forEach((category) {
            category['isHighlighted'] = category['title'] == text;
          });
        });
        widget.onCategorySelected(text);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isHighlighted ? const Color(0xFF0C69C0) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: isHighlighted
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                  )
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isHighlighted ? Colors.white : const Color(0xFF474747),
            fontSize: 12,
            fontFamily: 'Readex Pro',
          ),
        ),
      ),
    );
  }
}
