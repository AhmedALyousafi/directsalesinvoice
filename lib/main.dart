import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/cubit/cubit.dart';
import 'package:pos_system/features/pos/presentation/pos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceCubit(),
      child: MaterialApp(
        title: 'POS System',
        theme: ThemeData(
          primaryColor: const Color(0xFF094F90),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF094F90),
          ),
          fontFamily: 'Readex Pro',
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const POSScreen(),
      ),
    );
  }
}
