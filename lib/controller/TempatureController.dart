import 'package:get/get.dart';
import 'package:ambientes_app/controller/MQTTController.dart';
import '../helpers/BaseMqttHandler.dart';

class TempatureController extends GetxController {
  var tempature = 22.0.obs;
  var index = 0.obs;
  var isConnected = false.obs; // Reactive variable to track MQTT connection status
  late BaseMQTTScreen baseMQTTScreen;

  @override
  void onInit() {
    super.onInit();
    initializeMQTT();
  }

  Future<void> initializeMQTT() async {
    await MQTTService.connect();
    isConnected.value = MQTTService().isConnected();

    if (isConnected.value) {
      MQTTService.subscribe('showroom/sala/ac/temperatura', (message) {
        double tempValue = double.tryParse(message) ?? 0.0;
        tempature.value = tempValue;
        print('test ${tempature.value}');
      });
    }
  }
}








