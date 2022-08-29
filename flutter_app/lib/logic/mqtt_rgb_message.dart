import 'package:mqtt_interface/logic/mqtt_base_message.dart';

import '../helpers/ui/Cards/colorpicker.dart';
import '../helpers/ui/Cards/command_card.dart';
import 'localstate.dart';
import 'package:flutter/material.dart';

class MqttRGBMessage implements MqttBaseMessage {
  @override
  MqttRGBMessage({required this.topic, required this.type, required this.name});
  MqttRGBMessage.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    type = json['type'];
    name = json['name'];
  }
  @override
  late String topic;

  @override
  late String type;

  @override
  late String name;

  @override
  Map<String, dynamic> toJson() => {
        'topic': topic,
        'type': type,
        'name': name,
      };

  @override
  Function(int, int, int) getCallBack(ComponentLocalState localState) {
    if (type == "simple") {
      return (int r, int g, int b) =>
          {localState.publish("light", "rgb($r, $g, $b)")};
    } else {
      return (int r, int g, int b) =>
          {localState.publish("light", "{\"R\": $r,\"G\": $g,\"B\": $b}")};
    }
  }

  @override
  Widget getWidget(ComponentLocalState localState) {
    return ColorPicker(
      key: UniqueKey(),
      topic: topic,
      name: name,
      callback: getCallBack(localState),
    );
  }
}
