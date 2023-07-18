import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/body_cozinha.dart';

class SensorScreenKitchen extends StatelessWidget {
  const SensorScreenKitchen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: const SensorScreenKitchenBody(),
    );
  }
}
