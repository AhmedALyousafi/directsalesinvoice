import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/cubit/cubit.dart';
import 'package:pos_system/cubit/state.dart';
import 'package:pos_system/features/pos/presentation/widgets/plutogrid/pluto_grid_widget.dart';
import 'package:pos_system/features/pos/presentation/widgets/product/products_grid.dart';

class ProductEmptyState extends StatelessWidget {
  const ProductEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!state.plutogridwidget) ...[
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'لا يوجد منتجات مضافة لعرضها',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            context
                                .read<InvoiceCubit>()
                                .changesettingplutogridwidget();
                            // وظيفة التحميل هنا
                          },
                          child: const Text(
                            'تحميل منتجات إفتراضية للعرض',
                            style: TextStyle(
                              color: Color(0xFF0C69C0),
                              fontSize: 14,
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                      if (state.plutogridwidget)
                        const Expanded(child: PlutoGridWidget()),
                    ],
                  ),
                ),
              ),
              _buildFooter(),
              Container(
                height: 3,
                color: const Color(0xFF319626),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          _buildEditableField(
            icon: Icons.calendar_today_outlined,
            label: 'تاريخ الإنتهاء',
          ),
          const SizedBox(width: 8),
          _buildEditableField(
            icon: Icons.pie_chart_outline,
            label: 'المقطع التحليلي',
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField({required String label, required IconData icon}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: TextField(
          textAlignVertical: TextAlignVertical.center, // توسيط النص عموديًا
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontFamily: 'Readex Pro',
            ),
            border: InputBorder.none,
            isDense: true, // يقلل المساحة الرأسية
          ),
        ),
      ),
    );
  }
}
