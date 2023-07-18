import 'package:flutter/material.dart';
import 'custom_card.dart';

class SensorScreenKitchenBody extends StatefulWidget {
  const SensorScreenKitchenBody({super.key});

  @override
  _SensorScreenBodyState createState() => _SensorScreenBodyState();
}

class _SensorScreenBodyState extends State<SensorScreenKitchenBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      height: size.width * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/AMBIENTES_LOGOTIPO.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomCard(
                        size: size,
                        icon: Icon(
                          Icons.lightbulb_outline,
                          size: size.width * 0.15,
                          color: Colors.grey.shade400,
                        ),
                        title: "LED",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/cozinha/led',
                      ),
                    ),
                    // SizedBox(width: size.width * 0.05),
                    // Expanded(
                    //   flex: 1,
                    //   child: CustomCard(
                    //     size: size,
                    //     icon: Icon(
                    //       Icons.lightbulb_outline,
                    //       size: size.width * 0.15,
                    //       color: Colors.grey.shade400,
                    //     ),
                    //     title: "LED Laterais",
                    //     statusOn: "ON",
                    //     statusOff: "OFF",
                    //     topic: 'showroom/sala/led/laterais',
                    //   ),
                    // ),
                  ],
                ),
                // SizedBox(height: size.height * 0.025),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       flex: 1,
                //       child: CustomCard(
                //         size: size,
                //         icon: Icon(
                //           Icons.lightbulb_outline,
                //           size: size.width * 0.15,
                //           color: Colors.grey.shade400,
                //         ),
                //         title: "Luminario 1",
                //         statusOn: "ON",
                //         statusOff: "OFF",
                //         topic: 'showroom/sala/jantar/luminario/centro',
                //       ),
                //     ),
                //     SizedBox(width: size.width * 0.05),
                //     Expanded(
                //       flex: 1,
                //       child: CustomCard(
                //         size: size,
                //         icon: Icon(
                //           Icons.lightbulb_outline,
                //           size: size.width * 0.15,
                //           color: Colors.grey.shade400,
                //         ),
                //         title: "Luminario 2",
                //         statusOn: "ON",
                //         statusOff: "OFF",
                //         topic: 'showroom/sala/estar/luminario/centro',
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: size.height * 0.025),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       flex: 1,
                //       child: CustomCard(
                //         size: size,
                //         icon: Icon(
                //           Icons.lightbulb_outline,
                //           size: size.width * 0.15,
                //           color: Colors.grey.shade400,
                //         ),
                //         title: "Candeeiros",
                //         statusOn: "ON",
                //         statusOff: "OFF",
                //         topic: 'showroom/sala/estar/candeeiros',
                //       ),
                //     ),
                //     SizedBox(width: size.width * 0.05),
                //     Expanded(
                //       flex: 1,
                //       child: CustomCard(
                //         size: size,
                //         icon: Icon(
                //           Icons.window_outlined,
                //           size: size.width * 0.15,
                //           color: Colors.grey.shade400,
                //         ),
                //         title: "Cortina",
                //         statusOn: "ON",
                //         statusOff: "OFF",
                //         topic: '',
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
