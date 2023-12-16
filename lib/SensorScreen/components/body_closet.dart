import 'package:flutter/material.dart';
import '../../helpers/BaseMqttHandler.dart';
import 'custom_card.dart';

class SensorScreenClosetBody extends StatefulWidget {
  const SensorScreenClosetBody({super.key});

  @override
  _SensorScreenBodyState createState() => _SensorScreenBodyState();
}

class _SensorScreenBodyState extends State<SensorScreenClosetBody> {
  @override
  Widget build(BuildContext context) {
    return BaseMQTTScreen(
      child: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.05),
                InkWell(
                  child: IconButton(
                  alignment:Alignment.topLeft ,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  ),
               ),
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
                        title: "Luminário Centro",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/closet/luminario/centro',
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      flex: 1,
                      child: CustomCard(
                        size: size,
                        icon: Icon(
                          Icons.lightbulb_outline,
                          size: size.width * 0.15,
                          color: Colors.grey.shade400,
                        ),
                        title: "Luminário Parede",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/closet/luminario/parede',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
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
                        topic: 'showroom/closet/led',
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      flex: 1,
                      child: CustomCard(
                        size: size,
                        icon: Icon(
                          Icons.lightbulb_outline,
                          size: size.width * 0.15,
                          color: Colors.grey.shade400,
                        ),
                        title: "LED Interior",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/closet/led/interior',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    ),
    );
    
  }
}
