
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../controller/TempatureController.dart';
import '../../utils/AppAssets.dart';
import '../../utils/AppSpaces.dart';
import '../../widgets/buttons.dart';

class TempatureScreen extends StatelessWidget {
  const TempatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // Add Material widget here
      child: GetBuilder<TempatureController>(
        init: TempatureController(),
        builder: (controller) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(children: [
              AppSpaces.vertical30,
              Align( // Wrap the IconButton with Align
                  alignment: Alignment.topLeft, // Align the IconButton to the top left corner
                  child: InkWell(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: (Get.width - 60) / 3,
                child: Obx(
                  () => Row(children: [
                    
                    HomeButton(
                      image: AppAssets.temperature,
                      isSelected: controller.index.value == 0,
                      text: 'Temperatura',
                      onTap: () => controller.index.value = 0,
                      unSelectedImageColor: Colors.black,
                      fontSize: 16,
                    ),
                  ]),
                ),
              ),
              AppSpaces.vertical30,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      animationEnabled: false,
                      customColors: CustomSliderColors(
                        trackColor: Get.theme.disabledColor,
                        dotColor: Get.theme.disabledColor,
                        progressBarColor:Get.theme.disabledColor,
                      ),
                      startAngle: 130.0,
                      angleRange: 280.0,
                      
                      size: Get.mediaQuery.size.height,
                      customWidths: CustomSliderWidths(
                          progressBarWidth: 5, handlerSize: 10),
                    ),
                    min: 0,
                    max: 28,
                    initialValue: 0,
                   
                    // onChangeEnd: (value) => controller.tempature.value = value,
                    innerWidget: (percentage) => Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                  spreadRadius: 8,
                                ),
                              ],
                            ),
                            child: Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Get.theme.primaryColor,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.tempature.value.toStringAsFixed(0)}°C',
                                    style: TextStyle(
                                      fontSize: 15 +
                                          (22 *
                                              683 /
                                              Get.mediaQuery.size.height),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ))),
                      ),
                    ),
                  ),
                ),
              ),
              CircleButton(callback: (state) {
                
                print(state);
              }),
              AppSpaces.vertical10,
              AppSpaces.vertical10,
              
              AppSpaces.vertical30,
              
            ]),
          );
        },
      ),
    ) ;
  }
}
