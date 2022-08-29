import 'package:mqtt_interface/helpers/ui/Cards/toggle_card.dart';
import 'package:mqtt_interface/logic/mqtt_base_message.dart';

import '../helpers/ui/Cards/colorpicker.dart';
import '../helpers/ui/Cards/command_card.dart';
import 'localstate.dart';
import 'package:flutter/material.dart';

class MqttToggleMessage implements MqttBaseMessage {
  MqttToggleMessage({
    required this.topic,
    required this.onMsg,
    required this.offMsg,
    required this.name,
  });
  MqttToggleMessage.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    onMsg = json['onMsg'];
    offMsg = json['offMsg'];
    isOn = json['isOn'];
    name = json['name'];
  }
  @override
  String topic = '';
  @override
  String name = '';
  @override
  String onMsg = '';
  String offMsg = '';
  bool isOn = false;
  @override
  Map<String, dynamic> toJson() => {
        'topic': topic,
        'onMsg': onMsg,
        'offMsg': offMsg,
        'isOn': isOn,
        'name': name
      };

//not sure how to cast this output
  @override
  Function(bool state) getCallBack(ComponentLocalState localState) {
    return (state) => {
          if (state)
            localState.publish(topic, onMsg)
          else
            localState.publish(topic, offMsg)
        };
  }

  @override
  Widget getWidget(ComponentLocalState localState) {
    return ToggleCard(
      key: UniqueKey(),
      name: name,
      topic: topic,
      callback: getCallBack(localState),
    );
  }
}
