import '../helpers/ui/Cards/colorpicker.dart';
import '../helpers/ui/Cards/command_card.dart';
import 'localstate.dart';
import 'package:flutter/material.dart';

abstract class MqttBaseMessage {
  //MqttBaseMessage.fromJson(Map<String, dynamic> json);
  String topic = '';
  String name = '';
  Map<String, dynamic> toJson();

  Function getCallBack(ComponentLocalState localState);

  Widget getWidget(ComponentLocalState localState);
}
