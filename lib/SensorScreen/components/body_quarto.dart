import 'package:flutter/material.dart';
import 'custom_card.dart';

class SensorScreenBedBody extends StatefulWidget {
  const SensorScreenBedBody({super.key});

  @override
  _SensorScreenBodyState createState() => _SensorScreenBodyState();
}

class _SensorScreenBodyState extends State<SensorScreenBedBody> {
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
                        title: "LED",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/quarto/led',
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
                        title: "Luminária centro",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/quarto/luminario/centro',
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
                        title: "Candeeiro teto 1",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/quarto/candeeiro/teto/esquerdo',
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
                        title: "Candeeiro teto 2",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/quarto/candeeiro/teto/direito',
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
                        title: "Candeeiro piso 1",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/quarto/candeeiro/piso/esquerdo',
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
                        title: "Candeeiro piso 2",
                        statusOn: "ON",
                        statusOff: "OFF",
                        topic: 'showroom/quarto/candeeiro/piso/direito',
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
                          Icons.tv_rounded,
                          size: size.width * 0.15,
                          color: Colors.grey.shade400,
                        ),
                        title: "TV",
                        statusOn: "ON_OFF",
                        statusOff: "ON_OFF",
                        topic: 'showroom/quarto/tv',
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
