import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/constants/app_constants.dart';
import 'package:pos_system/cubit/cubit.dart';
import 'package:pos_system/cubit/state.dart';
import 'package:pos_system/features/pos/presentation/widgets/empte_products_management/products_list_view.dart';
import 'package:pos_system/features/pos/presentation/widgets/appbar/header_widget.dart';
import 'package:pos_system/features/pos/presentation/widgets/appbar/ivoicestatus.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment/pyment_widget.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment_module/payment_screen.dart';
import 'package:pos_system/features/pos/presentation/widgets/product/products_grid.dart';
import 'package:pos_system/features/pos/presentation/widgets/product/side_panel.dart';

class POSScreen extends StatelessWidget {
  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F9FF),
      body: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          return Column(
            children: [
              const HeaderWidget(),
              const SizedBox(
                height: 10,
              ),
              const InvoiceStatus(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding:
                            const EdgeInsets.all(AppConstants.defaultPadding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (state.settingMultiablePayment)
                              const Paymentwidget()
                            else ...[
                              const Expanded(child: ProductListView()),
                              const SizedBox(width: 10),
                              if (!state.haedproductgrid)
                                const Expanded(child: ProductGrid()),
                            ],
                            const SizedBox(width: 5),
                            const SidePanel(),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
