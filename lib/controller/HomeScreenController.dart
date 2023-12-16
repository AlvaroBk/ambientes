import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  int index = 0;

  void setIndex(int index) {
    this.index = index;
    update();
  }

  RxBool isMqttConnected = false.obs;

  // This method should be called when MQTT is connected
  void mqttConnected() {
    isMqttConnected.value = true;
  }

  // This method should be called when MQTT is disconnected
  void mqttDisconnected() {
    isMqttConnected.value = false;
  }
}
