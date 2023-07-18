import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: const SensorScreenBody(),
    );
  }
}
