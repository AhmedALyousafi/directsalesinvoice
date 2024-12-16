import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/model/item_model.dart';
import 'package:pos_system/cubit/cubit.dart';
import 'package:pos_system/cubit/state.dart';
import 'package:pos_system/features/pos/presentation/widgets/plutogrid/pluto_grid_widget.dart';

class ProductCard extends StatefulWidget {
  final ItemModel itemModel;
  final bool showImage; // حالة التحكم بعرض الصور

  const ProductCard({
    super.key,
    required this.itemModel,
    required this.showImage,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isHovered = false; // تتبع حالة الماوس

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true), // عند التحويم
          onExit: (_) =>
              setState(() => isHovered = false), // عند الخروج من التحويم
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 1,
                      )
                    ],
              border: Border.all(
                color: isHovered ? Colors.green : const Color(0xFFF2F2F2),
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // شريط الخصم والإيقونات
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // الإيقونتان على اليمين
                          Row(
                            children: [
                              if (widget.itemModel.itemId == 'نفذ المخزون') ...[
                                Image.asset('assets/images/17.png'),
                                const SizedBox(width: 4), // مسافة بين الصورتين
                                Image.asset('assets/images/16.png'),
                              ] else if (widget.itemModel.itemId !=
                                  'نفذ المخزون')
                                Image.asset('assets/images/16.png'),
                            ],
                          ),

                          const SizedBox(width: 4),
                          // عرض الخصم إذا كانت موجودة
                          if (widget.itemModel.discount.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color(0xffFEFAF5),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                widget.itemModel
                                    .discount, // يعرض "خصم 10%" أو أي خصم آخر
                                style: const TextStyle(
                                  color: Color(0xffF69B42),
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Readex Pro',
                                ),
                              ),
                            ),
                          if (widget.itemModel.discount.isEmpty)
                            const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // صورة المنتج مع التأثير
                    if (widget.showImage)
                      AnimatedScale(
                        scale: isHovered ? 1.1 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          widget.itemModel.image,
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    // اسم المنتج
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isHovered ? Colors.green : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4.0),
                        child: Text(
                          widget.itemModel.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isHovered
                                ? Colors.white
                                : const Color(0xFF4B4B4B),
                            fontSize: 12,
                            fontFamily: 'Readex Pro',
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),

                // المحتوى الذي يظهر في الأسفل (نفس المكان)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    color: const Color(0xFFF2F2F2),
                    child: isHovered
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "500 ر.س",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Readex Pro',
                                ),
                              ),
                              const Text(
                                "قطعة",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Readex Pro',
                                ),
                              ),
                            ],
                          )
                        : Text(
                            widget.itemModel
                                .itemId, // يعرض itemId عند عدم التحويم
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF819AA7),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Readex Pro',
                            ),
                          ),
                  ),
                ),

                // زر الإضافة الدائري عند التحويم
                if (isHovered)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 70,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<InvoiceCubit>()
                            .changesettingplutogridwidget();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xffF1FEF0),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xff319626),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
