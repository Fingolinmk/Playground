import 'package:mqtt_interface/helpers/ui/Cards/slider_card.dart';
import 'package:mqtt_interface/logic/mqtt_base_message.dart';

import '../helpers/string_helper/add_word_at.dart';
import 'localstate.dart';
import 'package:flutter/material.dart';

class MqttSliderStringMessage implements MqttBaseMessage {
  MqttSliderStringMessage(
      {required this.topic,
      required this.msg,
      required this.name,
      required this.position,
      required this.min,
      required this.max});
  MqttSliderStringMessage.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    msg = json['onMsg'];
    name = json['name'];
    min = json['min'];
    max = json['max'];
    position = json['position'];
  }
  @override
  String topic = '';
  @override
  String name = '';
  @override
  String msg = '';
  int position = 0;
  int min = 0;
  int max = 255;
  @override
  Map<String, dynamic> toJson() => {
        'topic': topic,
        'msg': msg,
        'name': name,
        'position': position,
        'min': min,
        'max': max
      };

//not sure how to cast this output
  @override
  Function(int, int) getCallBack(ComponentLocalState localState) {
    return (int position, int value) =>
        {localState.publish(topic, addNumberAt(msg, position, value))};
  }

  @override
  Widget getWidget(ComponentLocalState localState) {
    return SliderCard(
      key: UniqueKey(),
      name: name,
      topic: topic,
      maximum: max,
      minimum: min,
      position: position,
      msg: msg,
      callback: getCallBack(localState),
    );
  }
}
