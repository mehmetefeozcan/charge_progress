import 'package:charge_progress/spin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fixed_spin_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: FixedSpinView(),
    );
  }
}
