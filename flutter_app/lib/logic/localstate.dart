import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_interface/logic/mqtt_button_message.dart';
import 'package:mqtt_interface/logic/mqtt_rgb_message.dart';
import 'package:mqtt_interface/logic/mqtt_slider_string_message.dart';
import 'package:mqtt_interface/logic/mqtt_toggle_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponentLocalState extends ChangeNotifier {
  ComponentLocalState() {
    client = MqttServerClient(address, myName);
    client.port = port;
  }
  loadJson(Map<String, dynamic> json) {
    button_msgs = [];

    for (final item in jsonDecode(json['button_msgs'])) {
      var test = MqttButtonMessage.fromJson(item);

      button_msgs.add(test);
    }
    rgb_msgs = [];
    for (final item in jsonDecode(json['rgb_msgs'])) {
      var test = MqttRGBMessage.fromJson(item);

      rgb_msgs.add(test);
    }

    toggle_msgs = [];
    if (json['toggle_msgs'] != null && json['toggle_msgs'] != []) {
      for (final item in jsonDecode(json['toggle_msgs'])) {
        var test = MqttToggleMessage.fromJson(item);

        toggle_msgs.add(test);
      }
    }

    address = json['address'];
    port = json['port'];
    myName = json['myName'];
    willTopic = json['willTopic'];
    willMessage = json['willMessage'];
    client = MqttServerClient(address, myName);
    client.port = port;
    client.keepAlivePeriod = 60;
  }

  int retryCtr = 0;
  bool isConnected = false;
  bool connectionDataChanged = false;

  String address = '192.168.178.98';
  int port = 1883;
  String myName = "quackquack";
  String willTopic = "willtopic";
  String willMessage = "willmessage";
  late MqttServerClient client;

  List<MqttButtonMessage> button_msgs = [];
  List<MqttRGBMessage> rgb_msgs = [];
  List<MqttToggleMessage> toggle_msgs = [];
  List<MqttSliderStringMessage> slider_string_msgs = [];
  Map<String, dynamic> toJson() => {
        'address': address,
        'port': port,
        'myName': myName,
        'willTopic': willTopic,
        'willMessage': willMessage,
        'button_msgs': jsonEncode(button_msgs),
        'rgb_msgs': jsonEncode(rgb_msgs),
        'toggle_msgs': jsonEncode(toggle_msgs),
        'slider_string_msgs': jsonEncode(slider_string_msgs),
      };

  Future<void> save() async {
    final String jsonString = jsonEncode(this);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('localstate', jsonString);
  }

  Future<bool> load() async {
    final prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    final String? jsonStr = prefs.getString('localstate');
    if (jsonStr != null && jsonStr != '[]') {
      loadJson(jsonDecode(jsonStr));
      return true;
    }
    return false;
  }

  void addButtonMessage(MqttButtonMessage message) {
    button_msgs.add(message);
    notifyListeners();
  }

  void addToggleMessage(MqttToggleMessage message) {
    toggle_msgs.add(message);
    notifyListeners();
  }

  void addSliderStringMessage(MqttSliderStringMessage message) {
    slider_string_msgs.add(message);
    notifyListeners();
  }

  void addRGBMessage(MqttRGBMessage message) {
    rgb_msgs.add(message);
    notifyListeners();
  }

  void setAddress(String newAddress) {
    address = newAddress;
    connectionDataChanged = true;
    connect();
    notifyListeners();
  }

  void setPort(int newPort) {
    port = newPort;
    connectionDataChanged = true;
    connect();
    notifyListeners();
  }

  void setMyName(String newName) {
    connectionDataChanged = true;
    myName = newName;
    connect();
    notifyListeners();
  }

  String lastPayload = "";
  String lastTopic = "";
  DateTime lastSend = DateTime.utc(1989, 11, 9);
  Future<int> publish(String topic, String payload) async {
    print("publish under topic: [$topic] payload: [$payload] ");
    if (client.connectionStatus != null &&
        client.connectionStatus?.state != null &&
        client.connectionStatus?.state == MqttConnectionState.connected) {
      //surpress that the same message is sent over and over again
      if (lastPayload == payload &&
          lastTopic == topic &&
          DateTime.now().difference(lastSend).inMilliseconds < 75) {
        debugPrint(
            "Not sending delta: ${DateTime.now().difference(lastSend).inMilliseconds.toString()} ms");
        return -1;
      }
      final builder = MqttClientPayloadBuilder();
      builder.addString(payload);
      client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
      retryCtr = 0;
      lastSend = DateTime.now();
      lastPayload = payload;
      lastTopic = topic;
      return 0;
    } else {
      if (retryCtr < 20) {
        //print('retry.. ${client.connectionStatus}');
        retryCtr++;
        debugPrint("Waiting ${pow(2, retryCtr).toInt()} seconds");
        await Future.delayed(
            Duration(seconds: pow(2, retryCtr).toInt()), () {});
        await connect();
        return publish(topic, payload);
      }
    }
    return -1;
  }

  bool isAlive() {
    return (isConnected &&
        !connectionDataChanged &&
        (client.connectionStatus!.state == MqttConnectionState.connected));
  }

// TODO I must check if the address/Port etc changed for a proper reconnect
  Future<int> connect() async {
    if (!connectionDataChanged &&
        isConnected &&
        client.connectionStatus!.state == MqttConnectionState.connected) {
      return 0;
    }
    client.logging(on: false);
    client.setProtocolV311();
    final connMess = MqttConnectMessage()
        .withClientIdentifier(myName)
        .withWillTopic(willTopic) // If you set this you must set a will message
        .withWillMessage(willMessage)
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      debugPrint('EXAMPLE::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      debugPrint('EXAMPLE::socket exception - $e');
      client.disconnect();
    }
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      debugPrint('Mosquitto client connected');
      if (!isConnected) {
        isConnected = true;

        notifyListeners();
      }
      isConnected = true;
      connectionDataChanged = false;
      return 0;
    } else {
      /// Use status here rather than state if you also want the broker return code.
      debugPrint(
          'ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      if (isConnected) {
        notifyListeners();
      }
      isConnected = false;
      return -1;
    }
  }

  bool removeButtonMsg(String name, String topic, String payload) {
    print("Refine me, you need an ID for this!");
    for (var item in button_msgs) {
      if (item.payload == payload) {
        if (item.topic == topic) {
          if (item.payload == payload) {
            if (button_msgs.remove(item)) {
              save();
              notifyListeners();
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  bool removeRGB(String name, String topic) {
    print("Refine me, you need an ID for this!");

    for (var item in rgb_msgs) {
      if (item.name == name) {
        if (item.topic == topic) {
          if (rgb_msgs.remove(item)) {
            save();
            notifyListeners();
            return true;
          }
        }
      }
    }
    return false;
  }

  bool removeToggle(String name, String topic) {
    print("Refine me, you need an ID for this!");

    for (var item in toggle_msgs) {
      if (item.name == name) {
        if (item.topic == topic) {
          if (toggle_msgs.remove(item)) {
            save();
            notifyListeners();
            return true;
          }
        }
      }
    }
    return false;
  }
}
