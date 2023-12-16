import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/MQTTController.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.icon,
    required this.title,
    required this.statusOn,
    required this.statusOff,
    required this.topic,
    required this.upButtonLabel,
    required this.downButtonLabel,
    required this.pauseButtonLabel,
  }) : super(key: key);

  final Size size;
  final Icon icon;
  final String title;
  final String statusOn;
  final String statusOff;
  final String topic;
  final String upButtonLabel;
  final String downButtonLabel;
  final String pauseButtonLabel;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}
class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  late Animation<Alignment> _animation;
  int _buttonState = 0; // 0: Up, 1: Down, 2: Pause

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: pi, // Rotate 180 degrees for pause button
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animation = Tween<Alignment>(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        reverseCurve: Curves.easeInBack,
      ),
    );
    super.initState();
  }

  // Rest of the code remains unchanged

  @override
  Widget build(BuildContext context) {
    // Rest of the code remains unchanged

    return Container(
      // Rest of the code remains unchanged

      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.icon,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle the Up button action
                        setState(() {
                          _buttonState = 0;
                          _animationController.reverse();
                          // Publish MQTT message for Up
                          MQTTService.publishMessage(widget.topic, widget.upButtonLabel);
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_up),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle the Down button action
                        setState(() {
                          _buttonState = 1;
                          _animationController.reverse();
                          // Publish MQTT message for Down
                          MQTTService.publishMessage(widget.topic, widget.downButtonLabel);
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle the Pause button action
                        setState(() {
                          _buttonState = 2;
                          if (_animationController.isDismissed) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          // Publish MQTT message for Pause
                          MQTTService.publishMessage(widget.topic, widget.pauseButtonLabel);
                        });
                      },
                      child: RotationTransition(
                        turns: _rotateAnimation,
                        child: Icon(
                          Icons.pause,
                          color: _buttonState == 2
                              ? Colors.grey.withOpacity(0.6)
                              : Colors.red, // Adjust color for Pause button
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Rest of the code remains unchanged
          ],
        ),
      ),
    );
  }
}

