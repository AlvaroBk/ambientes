import 'package:ambientes_app/controller/MQTTController.dart';
import 'package:flutter/material.dart';
import '../SensorScreen/components/TempatureScreen.dart';
import '../SensorScreen/sensor_screen.dart';
import '../SensorScreen/sensor_screen_closet.dart';
import '../SensorScreen/sensor_screen_kitchen.dart';
import '../SensorScreen/sensor_screen_quarto.dart';
import '../controller/HomeScreenController.dart';
import '../utils/AppAssets.dart';
import '../utils/AppSpaces.dart';
import '../widgets/buttons.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    MQTTService.connect();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/ambientes.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                width: size.height * 0.2,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/AMBIENTES_LOGOTIPO.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              AppSpaces.vertical10,
              Expanded(
                child: Row(children: [
                  HomeButton(
                    image: AppAssets.livingroom,
                    text: 'Sala de Estar',
                    isSelected: controller.index == 0,
                    onTap: () {
                      controller.setIndex(0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SensorScreen()),
                      );
                    },
                  ),
                  AppSpaces.horizontal20,
                  HomeButton(
                    image: AppAssets.bedroom,
                    text: 'Quarto',
                    isSelected: controller.index == 1,
                    onTap: () {
                      controller.setIndex(1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SensorScreenQuarto()),
                      );
                    },
                  ),
                ]),
              ),
              AppSpaces.vertical20,
              Expanded(
                child: Row(children: [
                  HomeButton(
                      image: AppAssets.kitchen,
                      text: 'Cozinha',
                      isSelected: controller.index == 2,
                      onTap: () {
                        controller.setIndex(2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SensorScreenKitchen()),
                        );
                      }),
                  AppSpaces.horizontal20,
                  HomeButton(
                      image: AppAssets.closet,
                      text: 'closet',
                      isSelected: controller.index == 3,
                      onTap: () {
                        controller.setIndex(3);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SensorScreenCloset()),
                        );
                      }),
                ]),
              ),
              AppSpaces.vertical20,
              Expanded(
                child: Row(children: [
                  HomeButton(
                    image: AppAssets.temperature,
                    text: 'AC',
                    isSelected: controller.index == 4,
                    onTap: () {
                      controller.setIndex(3);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TempatureScreen()),
                      );
                    },
                  ),
                  // AppSpaces.horizontal20,
                  // HomeButton(
                  //   image: AppAssets.washingroom,
                  //   text: 'Washing Room',
                  //   isSelected: controller.index == 5,
                  //   onTap: () => controller.setIndex(5),
                  // ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
