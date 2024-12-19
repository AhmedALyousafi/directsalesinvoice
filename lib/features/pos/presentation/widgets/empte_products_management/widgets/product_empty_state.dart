import 'package:dropdown_button2/dropdown_button2.dart';
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
                        Expanded(child: PlutoGridWidget()),
                    ],
                  ),
                ),
              ),
              const Divider(height: 0.5),
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
      child: Row(
        children: [
          _buildEditableField2(
            'تاريخ الإنتهاء',
          ),
          const SizedBox(width: 8),
          _buildEditableField(
            'المقطع التحليلي',
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Container(
          height: 40,
          color: Colors.white,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownButtonFormField2<String>(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // تغيير لون الحدود إلى الأبيض
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white), // إضافة حدود عند التركيز
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
              ),
              hint: Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // محاذاة النص إلى اليمين
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12, // حجم الخط الجديد
                    ),
                  ),
                ],
              ),
              items: [
                DropdownMenuItem(
                  value: "1",
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // محاذاة النص إلى اليمين
                    children: [
                      Text(
                        "Option 1",
                        style: TextStyle(fontSize: 12), // حجم الخط الجديد
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // محاذاة النص إلى اليمين
                    children: [
                      Text(
                        "Option 2",
                        style: TextStyle(fontSize: 12), // حجم الخط الجديد
                      ),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField2(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Container(
          height: 40,
          color: Colors.white,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownButtonFormField2<String>(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // تغيير لون الحدود إلى الأبيض
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white), // إضافة حدود عند التركيز
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.calendar_month_outlined),
                iconSize: 24,
              ),
              hint: Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // محاذاة النص إلى اليمين
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12, // حجم الخط الجديد
                    ),
                  ),
                ],
              ),
              items: [
                DropdownMenuItem(
                  value: "1",
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // محاذاة النص إلى اليمين
                    children: [
                      Text(
                        "Option 1",
                        style: TextStyle(fontSize: 12), // حجم الخط الجديد
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // محاذاة النص إلى اليمين
                    children: [
                      Text(
                        "Option 2",
                        style: TextStyle(fontSize: 12), // حجم الخط الجديد
                      ),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
        ),
      ),
    );
  }
}
