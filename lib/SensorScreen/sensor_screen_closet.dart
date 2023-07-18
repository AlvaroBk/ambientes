import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/body_closet.dart';

class SensorScreenCloset extends StatelessWidget {
  const SensorScreenCloset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: const SensorScreenClosetBody(),
    );
  }
}
