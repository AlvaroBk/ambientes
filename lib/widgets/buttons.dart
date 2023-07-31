import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/MQTTController.dart';
import '../utils/AppAssets.dart';
import '../utils/AppSpaces.dart';
import '../utils/Others.dart';

class TopSelectButton extends StatelessWidget {
  const TopSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: const [
        DropdownMenuItem<String>(
          value: 'All Rooms',
          child: Text('All Rooms'),
        ),
        DropdownMenuItem<String>(
          value: 'Living Room',
          child: Text('Living Room'),
        ),
      ],
      hint: const Text(
        'Living Room',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
      icon: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(CupertinoIcons.chevron_down)),
      iconSize: 20,
      iconEnabledColor: Colors.black,
      underline: const SizedBox.shrink(),
      onChanged: (value) {},
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.fontSize = 18,
    this.unSelectedImageColor,
  }) : super(key: key);
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? unSelectedImageColor;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: isSelected ? appGradient : null,
            color: !isSelected ? Get.theme.colorScheme.background : null,
          ),
          child: Column(children: [
            AppSpaces.vertical15,
            Expanded(
              child: Center(
                child: SizedBox(
                  width: Get.width / 5,
                  height: Get.height / 10,
                  child: Image.asset(
                    image,
                    color: isSelected
                        ? Colors.white
                        : (unSelectedImageColor ?? Get.theme.primaryColor),
                  ),
                ),
              ),
            ),
            AppSpaces.vertical15,
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: fontSize,
              ),
            ),
            AppSpaces.vertical15,
          ]),
        ),
      ),
    );
  }
}

class CircleButton extends StatefulWidget {
  final Function(String) callback;

  const CircleButton({Key? key, required this.callback}) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool isOn = false;

  void _toggleButtonState() {
    setState(() {
      isOn = !isOn;
    });

    String state = isOn ? 'AN' : 'AO';
    widget.callback(state);
    MQTTService.publishMessage('showroom/sala/ac', state);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleButtonState,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isOn ? Colors.green : Colors.red,
        ),
        padding: const EdgeInsets.all(9.0),
        child: Image.asset(
          AppAssets.onOff,
          width: 25,
          height: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: appGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
