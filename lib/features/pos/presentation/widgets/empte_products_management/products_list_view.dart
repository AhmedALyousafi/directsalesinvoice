import 'package:flutter/material.dart';
import 'package:pos_system/features/pos/presentation/widgets/empte_products_management/widgets/empty_product_header.dart';
import 'package:pos_system/features/pos/presentation/widgets/empte_products_management/widgets/product_empty_state.dart';
import 'package:pos_system/features/pos/presentation/widgets/empte_products_management/widgets/product_summary.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF9F9F9),
      ),
      child: Column(
        children: const [
          ProductsHeader(),
          ProductEmptyState(),
          ProductSummary(),
        ],
      ),
    );
  }
}
