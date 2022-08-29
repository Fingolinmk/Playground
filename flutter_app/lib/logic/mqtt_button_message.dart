import 'package:mqtt_interface/logic/mqtt_base_message.dart';

import '../helpers/ui/Cards/colorpicker.dart';
import '../helpers/ui/Cards/command_card.dart';
import 'localstate.dart';
import 'package:flutter/material.dart';

class MqttButtonMessage implements MqttBaseMessage {
  MqttButtonMessage(
      {required this.topic, required this.payload, required this.name});
  MqttButtonMessage.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    payload = json['payload'];
    name = json['name'];
  }
  @override
  String topic = '';
  @override
  String payload = '';
  @override
  String name = '';
  @override
  Map<String, dynamic> toJson() => {
        'topic': topic,
        'payload': payload,
        'name': name,
      };

//not sure how to cast this output
  @override
  Function getCallBack(ComponentLocalState localState) {
    return () => {localState.publish(topic, payload)};
  }

  @override
  Widget getWidget(ComponentLocalState localState) {
    return CommandCard(
        key: UniqueKey(),
        name: name,
        command: payload,
        topic: topic,
        callback: () => {localState.publish(topic, payload)});
  }
}
