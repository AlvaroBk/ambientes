import 'package:flutter/cupertino.dart';

import '../controller/MQTTController.dart';

class BaseMQTTScreen extends StatefulWidget {
  final Widget child;

  BaseMQTTScreen({required this.child});

  @override
  _BaseMQTTScreenState createState() => _BaseMQTTScreenState();
}

class _BaseMQTTScreenState extends State<BaseMQTTScreen> with WidgetsBindingObserver {
  MQTTService mqttManager = MQTTService();
   bool isMQTTConnected = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    connectToMQTT();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    MQTTService.disconnect();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      connectToMQTT();
    } else if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      MQTTService.disconnect();
    }
  }

  void connectToMQTT() {
    MQTTService.connect();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
