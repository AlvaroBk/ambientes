import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/body_quarto.dart';

class SensorScreenQuarto extends StatelessWidget {
  const SensorScreenQuarto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: const SensorScreenBedBody(),
    );
  }
}
