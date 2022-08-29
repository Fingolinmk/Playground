import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mqtt_interface/helpers/string_helper/add_word_at.dart';
import 'package:mqtt_interface/logic/mqtt_toggle_message.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../../logic/localstate.dart';
import '../../logic/mqtt_button_message.dart';
import '../../logic/mqtt_slider_string_message.dart';
import '../locale.dart';

int? makeSliderDivisons(String payload) {
  print(payload.length);
  if (payload.isNotEmpty) return payload.length;
  return null;
}

class AddSliderForm extends StatefulWidget {
  const AddSliderForm({Key? key}) : super(key: key);

  @override
  AddSliderFormState createState() {
    return AddSliderFormState();
  }
}

class AddSliderFormState extends State<AddSliderForm> {
  String topic = "";
  String payload = "";

  String name = "";
  int minimum = 0;
  int maximum = 255;
  int position = 0;
  double pos = 0;
  List<String> types = ["string", "json"];
  String type = "string";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localstate = Provider.of<ComponentLocalState>(context);

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Enter Name
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.enterAName(),
            ),
            onChanged: (value) {
              name = value;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          //Enter Topic
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.topic(),
            ),
            onChanged: (value) {
              topic = value;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
          ),
          Row(
            children: [
              Text(Strings.howToSendVal()),
              const SizedBox(width: 5),
              DropdownButton<String>(
                value: type,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    type = newValue!;
                  });
                },
                items: types.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          if (type == "string")
            //Enter Message
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: Strings.Message(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      payload = value;
                    });
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "Enter the minimum",
                  ),
                  onChanged: (value) {
                    minimum = int.tryParse(value)!;
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "Enter the maximum",
                  ),
                  onChanged: (value) {
                    maximum = int.tryParse(value)!;
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                if (payload.isNotEmpty)
                  Slider(
                      value: pos,
                      min: 0,
                      max: max(0, payload.length.toDouble()).toDouble(),
                      divisions: makeSliderDivisons(payload),
                      label: addNumberAt(payload, position, position),
                      onChanged: (double value) => {
                            setState(() {
                              pos = value;
                              position = pos.round();
                            })
                          })
              ],
            )
          else
            Text("not yet implemented"),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  localstate.addSliderStringMessage(MqttSliderStringMessage(
                      topic: topic,
                      msg: payload,
                      position: position,
                      name: name,
                      min: minimum,
                      max: maximum));
                  localstate.save();

                  Routemaster.of(context).push("/");
                }
              },
              child: Text(Strings.save()),
            ),
          ),
        ],
      ),
    );
  }
}
