import 'package:get/get.dart';
import 'package:ambientes_app/controller/MQTTController.dart';

class TempatureController extends GetxController {
  var tempature = 22.0.obs;
  var index = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // Subscribe to the MQTT topic and update the temperature value
    MQTTService.subscribe('showroom/sala/ac/temperatura', (message) {
     
      double tempValue = double.tryParse(message) ?? 0.0; // Convert the received message to a double
 
      setState(){
        tempature.value = tempValue;
      }
    
    });
  }
}
