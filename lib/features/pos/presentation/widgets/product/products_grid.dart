import 'package:flutter/material.dart';
import 'package:pos_system/core/constants/app_constants.dart';
import 'package:pos_system/core/model/item_model.dart';
import 'package:pos_system/features/pos/presentation/widgets/product/category_bar.dart';
import 'package:pos_system/features/pos/presentation/widgets/product/product_card.dart';
import 'search_bar.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  bool showImages = true; // حالة التحكم بعرض الصور
  String currentCategory = 'الاكثر مبيعا'; // الفئة الحالية
  String searchQuery = ''; // النص الذي يتم إدخاله في حقل البحث

  // قائمة المنتجات
  final List<ItemModel> itemModel = [
    ItemModel(
        image: 'assets/images/1.png',
        name: 'فرن غاز هوم إلك 5 عين كامل',
        itemId: 'CS-22252',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/2.png',
        name: 'مطحنة قهوة هوم إلك 400 واط',
        itemId: 'CS-4001',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/3.png',
        name: 'خبازة هوم إلك 2200 واط أبيض  ',
        itemId: 'CS-2214',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/4.png',
        name: 'مطحنة قهوة هوم إلك 400 واط',
        itemId: 'CS-4001',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/5.png',
        name: 'قدر الضغط الكهربائي هوم الك 35 لتر 3600وات',
        itemId: 'CK-CSDS2',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/6.png',
        name: 'صانعة كيك هوم الك 1600 واط',
        itemId: 'C-234',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/7.png',
        name: 'بلاك اند ديكر كاوية بخار 2400 واط',
        itemId: 'نفذ المخزون',
        discount: ''),
    ItemModel(
        image: 'assets/images/8.png',
        name: 'آلة وافل الك 4 خانات 1000 واط',
        itemId: 'CK-23',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/9.png',
        name: 'خلاط هوم الك بشاشة رقمية 700 واط احمر',
        itemId: 'نفذ المخزون',
        discount: ''),
    ItemModel(
        image: 'assets/images/10.png',
        name: 'طقم ملاعق ذهبي 30 قطعة',
        itemId: 'CK-CSDS1',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/11.png',
        name: 'طقم اواني طبخ',
        itemId: 'CK-CSDS3',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/12.png',
        name: 'مجموعة عناية شخصية متكاملة',
        itemId: 'CK-CSDS21',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/13.png',
        name: 'كشتات تسوق ',
        itemId: 'CK-CSDS11',
        discount: 'خصم 10%'),
    ItemModel(
        image: 'assets/images/14.png',
        name: 'جيف منظف منزلي',
        itemId: 'CK-CSDS221',
        discount: 'خصم 10%'),
  ];

  // تصفية المنتجات بناءً على الفئة أو النص في حقل البحث
  List<ItemModel> get filteredItems {
    if (searchQuery.isEmpty) {
      if (currentCategory == 'الاكثر مبيعا') {
        return itemModel;
      } else if (currentCategory == 'اجهزة كهربائية') {
        return [
          ItemModel(
              image: 'assets/images/2.png',
              name: 'مطحنة قهوة هوم إلك 400 واط',
              itemId: 'CS-4001',
              discount: 'خصم 10%'),
          ItemModel(
              image: 'assets/images/7.png',
              name: 'بلاك اند ديكر كاوية بخار 2400 واط',
              itemId: 'نفذ المخزون',
              discount: ''),
          ItemModel(
              image: 'assets/images/9.png',
              name: 'خلاط هوم الك بشاشة رقمية 700 واط احمر',
              itemId: 'نفذ المخزون',
              discount: ''),
        ];
      } else if (currentCategory == 'الأجهزة المنزلية') {
        return [
          ItemModel(
              image: 'assets/images/1.png',
              name: 'فرن غاز هوم إلك 5 عين كامل',
              itemId: 'CS-22252',
              discount: 'خصم 10%'),
          ItemModel(
              image: 'assets/images/3.png',
              name: 'خبازة هوم إلك 2200 واط أبيض',
              itemId: 'CS-2214',
              discount: 'خصم 10%'),
          ItemModel(
              image: 'assets/images/5.png',
              name: 'قدر الضغط الكهربائي هوم الك 35 لتر 3600وات',
              itemId: 'CK-CSDS2',
              discount: 'خصم 10%'),
        ];
      } else if (currentCategory == 'الترامس وتقديمات الضيافة') {
        return [
          ItemModel(
              image: 'assets/images/5.png',
              name: 'قدر الضغط الكهربائي هوم الك 35 لتر 3600وات',
              itemId: 'CK-CSDS2',
              discount: 'خصم 10%'),
        ];
      } else if (currentCategory == 'المعالق والسكاكين') {
        return [
          ItemModel(
              image: 'assets/images/10.png',
              name: 'طقم ملاعق ذهبي 30 قطعة',
              itemId: 'CK-CSDS1',
              discount: 'خصم 10%'),
        ];
      } else if (currentCategory == 'أواني الطهي وأدوات المطبخ') {
        return [
          ItemModel(
              image: 'assets/images/11.png',
              name: 'طقم اواني طبخ',
              itemId: 'CK-CSDS3',
              discount: 'خصم 10%'),
        ];
      } else if (currentCategory == 'العناية الشخصية') {
        return [
          ItemModel(
              image: 'assets/images/12.png',
              name: 'مجموعة عناية شخصية متكاملة',
              itemId: 'CK-CSDS21',
              discount: 'خصم 10%'),
        ];
      } else if (currentCategory == 'كشتات') {
        return [
          ItemModel(
              image: 'assets/images/13.png',
              name: 'كشتات تسوق ',
              itemId: 'CK-CSDS11',
              discount: 'خصم 10%'),
        ];
      } else if (currentCategory == 'العناية بالمنزل وأدوات التنظيف') {
        return [
          ItemModel(
              image: 'assets/images/14.png',
              name: 'جيف منظف منزلي',
              itemId: 'CK-CSDS221',
              discount: 'خصم 10%'),
        ];
      }
      return itemModel;
    } else {
      return itemModel
          .where((item) =>
              item.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF1F9FF),
      ),
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        children: [
          CategoryBar(
            onCategorySelected: (category) {
              setState(() {
                currentCategory = category;
              });
            },
          ),
          const SizedBox(height: 8),
          SearchBar1(
            showImages: showImages,
            onToggleShowImages: () {
              setState(() {
                showImages = !showImages; // تبديل الحالة
              });
            },
            onSearch: (query) {
              setState(() {
                searchQuery = query;
              });
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3, // عدد الأعمدة
                mainAxisSpacing: 12, // المسافة بين الصفوف
                crossAxisSpacing: 8, // المسافة بين الأعمدة
                childAspectRatio: showImages
                    ? 163 / 215
                    : 167.67 / 110, // نسبة العرض إلى الطول
                children: List.generate(
                  filteredItems.length,
                  (index) => SizedBox(
                    width: 176, // العرض
                    height: 205, // الطول
                    child: ProductCard(
                      itemModel: filteredItems[index],
                      showImage: showImages, // حالة عرض الصور
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
