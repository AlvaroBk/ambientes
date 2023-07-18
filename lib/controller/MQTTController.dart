import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart' as mqtt;

class MQTTService {
  static mqtt.MqttServerClient? _client;

  static Future<void> connect() async {
    _client = mqtt.MqttServerClient('test.mosquitto.org', '');

    _client!.logging(on: true);

    _client!.clientIdentifier = 'Alvaro';

    try {
      await _client!.connect();
    } catch (e) {
      print('MQTT connection failed: $e');
      return;
    }

    if (_client!.connectionStatus!.state ==
        mqtt.MqttConnectionState.connected) {
      print('MQTT connected');
    } else {
      print('MQTT connection failed - disconnecting');
      _client!.disconnect();
    }
  }

  static void publishMessage(String topic, String message) {
    if (_client != null) {
      final builder = mqtt.MqttClientPayloadBuilder();
      builder.addString(message);
      _client!
          .publishMessage(topic, mqtt.MqttQos.exactlyOnce, builder.payload!);
    } else {
      print('MQTT client not initialized');
    }
  }
}

void main() {
  MQTTService.connect();
}
