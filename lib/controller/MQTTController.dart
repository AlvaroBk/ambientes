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

  static void disconnect() {
    if (_client != null) {
      if (_client!.connectionStatus!.state ==
          mqtt.MqttConnectionState.connected) {
        _client!.disconnect();
        print('MQTT disconnected');
      }
    } else {
      print('MQTT client not initialized');
    }
  }

  static void publishMessage(String topic, var message) {
    if (_client != null) {
      final builder = mqtt.MqttClientPayloadBuilder();
      builder.addString(message);
      _client!
          .publishMessage(topic, mqtt.MqttQos.exactlyOnce, builder.payload!);
    } else {
      print('MQTT client not initialized');
    }
  }

  static void subscribe(
      String topic, void Function(String) onMessageReceived) {
    if (_client != null) {
      _client!.subscribe(topic, mqtt.MqttQos.exactlyOnce);

      _client!.updates!.listen(
          (List<mqtt.MqttReceivedMessage<mqtt.MqttMessage?>> messages) {
        final mqtt.MqttPublishMessage message =
            messages[0].payload as mqtt.MqttPublishMessage;
        final String payload =
            mqtt.MqttPublishPayload.bytesToStringAsString(message.payload.message);
        onMessageReceived(payload);
        print(onMessageReceived);
      });
    } else {
      print('MQTT client not initialized');
    }
  }

  bool isConnected() {
    return _client?.connectionStatus?.state == mqtt.MqttConnectionState.connected ?? false;
  }
}

void main() {
  MQTTService.connect();
  // Simulate a disconnect after a while
  // Future.delayed(Duration(seconds: 10), () {
  //   MQTTService.disconnect();
  // });
}
